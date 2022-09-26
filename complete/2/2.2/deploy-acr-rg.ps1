#!/usr/bin/env pwsh

$psParameters = @{
    Name                   = "DeployMainACR-$((Get-Date).ToUniversalTime().ToString("yyyyMMddTHHmmssK"))"
    ResourceGroupName      = 'rg-bicep-vs-terraform'
    TemplateFile           = '.\main-acr-rg.bicep'
    Mode                   = 'Complete'
}

#Deploys the Azure Bicep template
New-AzResourceGroupDeployment @psParameters -WhatIf
