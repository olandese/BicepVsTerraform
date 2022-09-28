#!/usr/bin/env pwsh

$psParameters = @{
    Name              = "DeployToRG2-$((Get-Date).ToUniversalTime().ToString("yyyyMMddTHHmmssK"))"
    ResourceGroupName = 'rg-bicep-vs-terraform'
    TemplateFile      = '.\main-rg2.bicep'
    Verbose           = $true
    Mode              = 'Complete'
}

#Deploys the Azure Bicep template
New-AzResourceGroupDeployment @psParameters -WhatIf
