param location string
param storageName string
param storageSkuName string = 'Standard_LRS'
param tags object = {}

resource storage_reosurce 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: storageName
  tags: tags
  location: location
  sku: {
    name: storageSkuName
  }
  kind: 'Storage'
  properties: {}
}
