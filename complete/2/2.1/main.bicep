targetScope = 'subscription'

param resourceGroupName string = 'rg-expertslive-bicep'
param location string = 'westeurope'
param storageName string = 'sabicepvstf12345'
param vNetName string = 'vnet-bicep-expertslive'
param now string = utcNow()

param tags object = {
  Environment: 'nonprod'
  Team: 'Freelancers'
  Project: 'ExpertsLive'
}

resource bicepResourceGroup 'Microsoft.Resources/resourceGroups@2019-10-01' = {
  name: resourceGroupName
  tags: tags
  location: location
  properties: {}
}

module storage '../../../modules/storage.bicep' = {
  name: 'storageDeployment-${now}'
  scope: bicepResourceGroup
  params: {
    storageName: storageName
    location: bicepResourceGroup.location
  }
}

module vnet '../../../modules/vnet.bicep' = {
  name: 'vnetDeployment-${now}'
  scope: bicepResourceGroup
  params: {
    virtualNetworkName: vNetName
    location: bicepResourceGroup.location
  }
}

module acr '../../../modules/acrExisting.bicep' = {
  name: 'acrDeployment-${now}'
  scope: resourceGroup('rg-bicep-vs-terraform')
}
