targetScope = 'subscription'

param resourceGroupName string = 'rg-expertslive-bicep'
param location string = 'westeurope'
param storageName string = 'sabicepvstf12345'

param now string = utcNow()

resource bicepResourceGroup 'Microsoft.Resources/resourceGroups@2019-10-01' = {
  name: resourceGroupName
  location: location
  properties: {}
}

module storage '../../modules/storage.bicep' = {
  name: 'storageDeployment-${now}'
  scope: bicepResourceGroup
  params: {
    location: bicepResourceGroup.location
    storageName: storageName
  }
}

module vnet '../../modules/vnet.bicep' = {
  name: 'vnetDeployment-${now}'
  scope: bicepResourceGroup
  params: {
    location: bicepResourceGroup.location
  }
}
