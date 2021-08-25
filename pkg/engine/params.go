package engine

import (

	"github.com/microsoft/acc-vm-engine/pkg/api"
)

func getParameters(vm *api.APIModel, generatorCode string) (paramsMap, error) {
	properties := vm.Properties
	parametersMap := paramsMap{}

	addValue(parametersMap, "vmName", properties.VMProfile.Name)
	addValue(parametersMap, "vmSize", properties.VMProfile.VMSize)
	addValue(parametersMap, "osType", properties.VMProfile.OSType)
	addValue(parametersMap, "osImageName", properties.VMProfile.OSImageName)
	if len(properties.VMProfile.OSDiskType) > 0 {
		addValue(parametersMap, "osDiskType", properties.VMProfile.OSDiskType)
	}
	if properties.LinuxProfile != nil {
		addValue(parametersMap, "adminUsername", properties.LinuxProfile.AdminUsername)
		if len(properties.LinuxProfile.AdminPassword) > 0 {
			addValue(parametersMap, "authenticationType", "password")
			addValue(parametersMap, "adminPassword", properties.LinuxProfile.AdminPassword)
		} else {
			addValue(parametersMap, "authenticationType", "sshPublicKey")
		}
	}
	if properties.WindowsProfile != nil {
		addValue(parametersMap, "adminUsername", properties.WindowsProfile.AdminUsername)
		addValue(parametersMap, "adminPassword", properties.WindowsProfile.AdminPassword)
	}
	if properties.VMProfile.SecurityProfile != nil {
		addValue(parametersMap, "secureBootEnabled", properties.VMProfile.SecurityProfile.SecureBoot)
		addValue(parametersMap, "vTPMEnabled", properties.VMProfile.SecurityProfile.VTPM)
	}
	if len(properties.VMProfile.TipNodeSessionID) > 0 {
		addValue(parametersMap, "tipNodeSessionId", properties.VMProfile.TipNodeSessionID)
	}
	if len(properties.VMProfile.ClusterName) > 0 {
		addValue(parametersMap, "clusterName", properties.VMProfile.ClusterName)
	}
	if properties.VnetProfile.IsCustomVNET() {
		addValue(parametersMap, "vnetNewOrExisting", "existing")
		addValue(parametersMap, "vnetResourceGroupName", properties.VnetProfile.VnetResourceGroup)
		addValue(parametersMap, "vnetName", properties.VnetProfile.VnetName)
		addValue(parametersMap, "subnetName", properties.VnetProfile.SubnetName)
	} else {
		addValue(parametersMap, "vnetNewOrExisting", "new")
		addValue(parametersMap, "subnetAddress", properties.VnetProfile.SubnetAddress)
	}
	if properties.DiagnosticsProfile != nil && properties.DiagnosticsProfile.Enabled {
		addValue(parametersMap, "bootDiagnostics", "true")
		addValue(parametersMap, "diagnosticsStorageAccountName", properties.DiagnosticsProfile.StorageAccountName)
		if properties.DiagnosticsProfile.IsNewStorageAccount {
			addValue(parametersMap, "diagnosticsStorageAccountNewOrExisting", "new")
		} else {
			addValue(parametersMap, "diagnosticsStorageAccountNewOrExisting", "existing")
		}
	} else {
		addValue(parametersMap, "bootDiagnostics", "false")
	}
	return parametersMap, nil
}
