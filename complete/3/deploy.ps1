#!/usr/bin/env pwsh

$psParameters = @{
    Name                   = "DeployMainACR-$((Get-Date).ToUniversalTime().ToString("yyyyMMddTHHmmssK"))"
    ResourceGroupName      = 'rg-bicep-vs-terraform'
    TemplateFile           = '.\main.bicep'
    Verbose                = $true
    Mode                   = 'Complete'
    principalId            = (Get-AzADUser -DisplayName "Marco Mansi").id
    roleDefintionId        = (Get-AzRoleDefinition -Name 'AcrPull').id
}

#Deploys the Azure Bicep template
New-AzResourceGroupDeployment @psParameters -WhatIf
