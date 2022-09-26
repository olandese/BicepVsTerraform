@description('Specifies the location for resources.')
param location string = 'westeurope'
param storageName string = 'sabicep12345'
param vNetName string = 'vnet-bicep-expertslive'
param now string = utcNow()

module storage_module '../../modules/storage.bicep' = {
  name: 'storageDeployment-${now}'
  params: {
    storageName: storageName
    location: location
  }
}

module vnet_module '../../modules/vnet.bicep' = {
  name: 'vnetDeployment-${now}'
  params: {
    virtualNetworkName: vNetName
    location: location
  }
}

// From here it will be deployed in another RG

module storage_module_second '../../modules/storage.bicep' = {
  name: 'storageDeployment-secondary-${now}'
  scope: resourceGroup('rg-bicep-secondary')
  params: {
    storageName: 'sabicepvsterraform2'
    location: location
  }
}

module vnet_module_second '../../modules/vnet.bicep' = {
  name: 'vnetDeployment-secondary-${now}'
  scope: resourceGroup('rg-bicep-secondary')
  params: {
    virtualNetworkName: 'vnet-bicepvsterravorm-2'
    location: location
  }
}
