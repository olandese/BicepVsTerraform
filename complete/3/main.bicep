param now string = utcNow()
param principalId string
param roleDefintionId string

module acrExisting_module '../../modules/acrExisting.bicep' = {
  name: 'deployACR-${now}'
  params: {
    principalId: principalId
    roleDefintionId: roleDefintionId
  }
}
