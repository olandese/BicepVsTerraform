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

resource bicepResourceGroup_resource 'Microsoft.Resources/resourceGroups@2019-10-01' = {
  name: resourceGroupName
  tags: tags
  location: location
  properties: {}
}

module storage_module '../../../modules/storage.bicep' = {
  name: 'storageDeployment-${now}'
  scope: bicepResourceGroup_resource
  params: {
    storageName: storageName
    location: bicepResourceGroup_resource.location
  }
}

module vnet_module '../../../modules/vnet.bicep' = {
  name: 'vnetDeployment-${now}'
  scope: bicepResourceGroup_resource
  params: {
    virtualNetworkName: vNetName
    location: bicepResourceGroup_resource.location
  }
}

module acr_module '../../../modules/acrExisting.bicep' = {
  name: 'acrDeployment-${now}'
  scope: resourceGroup('rg-bicep-vs-terraform')
}
