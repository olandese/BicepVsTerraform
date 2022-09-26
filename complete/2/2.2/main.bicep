param now string = utcNow()
param location string = resourceGroup().location

// module acrExisting '../../../modules/acrExisting.bicep' = {
//   name: 'deployACR-${now}'
// }


module acrNew '../../../modules/acrNew.bicep' = {
  name: 'deployACR-${now}'
  params: {
    location: location
  }
}
