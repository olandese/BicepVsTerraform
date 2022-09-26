param now string = utcNow()
//param location string = resourceGroup().location

module acrExisting_module '../../../modules/acrExisting.bicep' = {
  name: 'deployACR-${now}'
}


// module acrNew_module '../../../modules/acrNew.bicep' = {
//   name: 'deployACR-${now}'
//   params: {
//     location: location
//   }
// }
