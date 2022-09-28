@description('Specifies the location for resources.')
param location string = 'westeurope'
param storageName string = 'sabicep12345'
param vNetName string = 'vnet-bicep-expertslive'
param now string = utcNow()

module storage_module '../modules/storage.bicep' = {
  name: 'storageDeployment-now'
  params: {
  storageName: storageName
  location: location
  }
}

// module vnet_module '../modules/vnet.bicep' = {
//   name: 'vnetDeployment-now'
//   params: {
//   virtualNetworkName: vNetName
//   location: location
//   }
// }
