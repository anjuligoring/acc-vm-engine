    "vmName": {
      "type": "string",
      "metadata": {
        "description": "Name of the VM."
      }
    },
    "vmSize": {
      "type": "string",
      {{GetVMSizes}}
      "metadata": {
        "description": "Size of the VM."
      }
    },
    "authenticationType": {
      "type": "string",
      "defaultValue": "password",
      "allowedValues": [
        "password",
        "sshPublicKey"
      ],
      "metadata": {
        "description": "Type of authentication to use on Linux virtual machine."
      }
    },
    "adminUsername": {
      "type": "string",
      "defaultValue": "azureuser",
      "metadata": {
        "description": "Username for the Virtual Machine."
      }
    },
    "adminPasswordOrKey": {
      "type": "securestring",
      "defaultValue": "",
      "metadata": {
        "description": "Password for the Virtual Machine."
      }
    },
    "osImageName": {
      "type": "string",
      "defaultValue": "Windows Server 2022 Gen 2",
      "allowedValues": [
        "Windows Server 2022 Gen 2",
        "Windows Server 2019 Gen 2",
        "Ubuntu 20.04 LTS Gen 2",
        "Ubuntu 18.04 LTS Gen 2"
      ],
      "metadata": {
        "description": "OS Image for the Virtual Machine"
      }
    },
    "osDiskType": {
      "type": "string",
      "defaultValue": "StandardSSD_LRS",
      "allowedValues": [
        "Premium_LRS",
        "StandardSSD_LRS"
      ],
      "metadata": {
        "description": "Type of managed disk to create."
      }
    },
    "vnetNewOrExisting": {
      "type": "string",
      "defaultValue": "new",
      "allowedValues": [
        "new",
        "existing"
      ],
      "metadata": {
        "description": "Determines whether or not a new virtual network should be provisioned"
      }
    },
    "vnetName": {
      "type": "string",
      "defaultValue": "[concat(resourceGroup().name, '-vnet')]",
      "metadata": {
        "description": "Name of the virtual network (alphanumeric, hyphen, underscore, period)."
      },
      "minLength": 2,
      "maxLength": 64
    },
    "vnetResourceGroupName": {
      "type": "string",
      "defaultValue": "[resourceGroup().name]",
      "metadata": {
        "description": "Name of the resource group for the existing virtual network."
      }
    },
    "vnetAddress": {
      "type": "string",
      "defaultValue": "{{.VnetProfile.VnetAddress}}",
      "metadata": {
        "description": "VNET address space"
      }
    },
    "subnetName": {
      "type": "string",
      "defaultValue": "[concat(resourceGroup().name, '-subnet')]",
      "metadata": {
        "description": "Name of the subnet."
      }
    },
    "subnetAddress": {
      "type": "string",
      "defaultValue": "{{.VnetProfile.SubnetAddress}}",
      "metadata": {
        "description": "Sets the subnet of the VM."
      }
    },
    "tipNodeSessionId": {
      "type": "string",
      "defaultValue": "",
      "metadata": {
        "description": "TIP Node session ID"
      }
    },
{{if HasSecurityProfile}}
    "secureBootEnabled": {
      "type": "string",
      "defaultValue": "true",
      "allowedValues": [
        "true",
        "false",
        "none"
      ],
      "metadata": {
        "description": "Secure Boot setting of the VM."
      }
    },
    "vTPMEnabled": {
      "type": "string",
      "defaultValue": "true",
      "allowedValues": [
        "true",
        "false"
      ],
      "metadata": {
        "description": "vTPM setting of the VM."
      }
    }, 
{{end}}
    "bootDiagnostics": {
      "type": "string",
      "defaultValue": "false",
      "allowedValues": [
        "true",
        "false"
      ],
      "metadata": {
        "description": "Boot diagnostics setting of the VM."
      }
    }
