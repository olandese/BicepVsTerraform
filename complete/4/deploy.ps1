#!/usr/bin/env pwsh

$psParameters = @{
    Name                   = "DeployToSecondaryRG-$((Get-Date).ToUniversalTime().ToString("yyyyMMddTHHmmssK"))"
    ResourceGroupName      = 'rg-expertslive-bicep'
    TemplateFile           = '.\main.bicep'
    Verbose                = $true
    Mode                   = 'Complete'
}

#Deploys the Azure Bicep template
New-AzResourceGroupDeployment @psParameters -WhatIf
