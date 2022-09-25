param storageName string
param location string = resourceGroup().location
param storageSkuName string = 'Standard_LRS'
param tags object = {}

resource storage_resource 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: storageName
  tags: tags
  location: location
  sku: {
    name: storageSkuName
  }
  kind: 'Storage'
  properties: {}
}
