targetScope = 'subscription'

param location string = 'westeurope'
param now string = utcNow()

resource bicepResourceGroup_resource 'Microsoft.Resources/resourceGroups@2019-10-01' = {
  name: 'rg-expertslive-bicep'
  location: location
  tags: {
    Environment: 'nonprod'
    Team: 'Freelancers'
    Project: 'ExpertsLive'
  }
  properties: {}
}

module storage_module '../modules/storage.bicep' = {
  name: 'storageDeployment-${now}'
  scope: bicepResourceGroup_resource
  params: {
    storageName: 'sabicep12345'
    location: bicepResourceGroup_resource.location
  }
}

module vnet_module '../modules/vnet.bicep' = {
  name: 'vnetDeployment-${now}'
  scope: bicepResourceGroup_resource
  params: {
    virtualNetworkName: 'vnet-bicep-expertslive'
    location: bicepResourceGroup_resource.location
  }
}
