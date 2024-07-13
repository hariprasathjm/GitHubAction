param location string = resourceGroup().location
param storageNamePrefix string

var stgacc_name = '${storageNamePrefix}${uniqueString(resourceGroup().id)}'

resource storage_account 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: stgacc name
  location: location
  sku: {
    name:  'Standard_LRS'
  }
  kind: 'StorageV2'
}

param con_name string
var container_name = '${con_name}${uniqueString(resourceGroup.id)}'

resource container_registry 'Microsoft.ContainerRegistry/registries@2023-11-01-preview' = {
  name: container_name
  location: location
  sku: {
    name: 'Basic'
  }
  properties:{adminUserEnabled:true
  }
  
}

 param asb_name string = "azurebus"

resource  asb 'Microsoft.ServiceBus/namespaces@2022-10-01-preview' = {
  name: asb_name
  location: location 
}

