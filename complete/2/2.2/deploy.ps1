#!/usr/bin/env pwsh

$psParameters = @{
    Name                   = 'DeployTestRBAC'
    ResourceGroupName      = 'rg-bicep-vs-terraform'
    TemplateFile           = '.\main.bicep'
    Mode                   = 'Complete'
}

#Deploys the Azure Bicep template
New-AzResourceGroupDeployment @psParameters -WhatIf
