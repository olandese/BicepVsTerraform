param acrName string = 'acrbicepvsterraform'
param principalId string = 'f9a8e52e-8a45-4d2b-8d11-0d9fd41266d3' //Marco Mansi
param roleDefintionId string = '7f951dda-4ed3-4680-a7ca-43fe172d538d' //AcrPull
param location string = resourceGroup().location

@allowed([
  'Group'
  'ServicePrincipal'
  'User'
])
param principalType string = 'User'

resource acr_resource 'Microsoft.ContainerRegistry/registries@2021-09-01' = {
  name: acrName
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    dataEndpointEnabled: false
    encryption: {
      status: 'disabled'
    }
  }
}

resource roleDefinition_resource 'Microsoft.Authorization/roleDefinitions@2018-01-01-preview' existing = {
  scope: subscription()
  name: roleDefintionId
}

resource roleAssignment_resource 'Microsoft.Authorization/roleAssignments@2020-10-01-preview' = {
  name: guid(acr_resource.name,  roleDefinition_resource.id,  principalId)
  scope: acr_resource
  properties: {
    roleDefinitionId: roleDefinition_resource.id
    principalId: principalId
    principalType: principalType
  }
}
