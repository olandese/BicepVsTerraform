param virtualNetworkName string
param addressPrefix string = '10.0.0.0/16'
param location string = resourceGroup().location
param tags object = {}

resource virtualNetwork_resource 'Microsoft.Network/virtualNetworks@2021-08-01' = {
  name: virtualNetworkName
  location: location
  tags: tags
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    enableDdosProtection: false
    subnets: []
  }
}
