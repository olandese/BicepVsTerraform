param acrName string = 'acrbicepvsterraform'
param principalId string = 'f9a8e52e-8a45-4d2b-8d11-0d9fd41266d3' //Marco Mansi
param roleDefintionId string = '7f951dda-4ed3-4680-a7ca-43fe172d538d' // AcrPull
//param location string = resourceGroup().location

@allowed([
  'Group'
  'ServicePrincipal'
  'User'
])
param principalType string = 'User'

resource acr 'Microsoft.ContainerRegistry/registries@2022-02-01-preview' existing = {
  name: acrName
}

// resource acr 'Microsoft.ContainerRegistry/registries@2021-09-01' = {
//   name: acrName
//   location: location
//   sku: {
//     name: 'Basic'
//   }
// }


resource roleDefinition 'Microsoft.Authorization/roleDefinitions@2018-01-01-preview' existing = {
  scope: subscription()
  name: roleDefintionId
}

resource RoleAssignment 'Microsoft.Authorization/roleAssignments@2020-10-01-preview' = {
  name: guid(acr.name,  roleDefinition.id,  principalId)
  scope: acr
  properties: {
    roleDefinitionId: roleDefinition.id
    principalId: principalId
    principalType: principalType
  }
}
