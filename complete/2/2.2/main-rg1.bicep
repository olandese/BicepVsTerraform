param location string = 'westeurope'
param now string = utcNow()

module storage_module '../modules/storage.bicep' = {
  name: 'storageDeployment-${now}'
  params: {
  storageName: 'sabicep12345'
  location: location
  }
}

module vnet_module '../modules/vnet.bicep' = {
  name: 'vnetDeployment-${now}'
  params: {
  virtualNetworkName: 'vnet-bicep-commday2023'
  location: location
  }
}
