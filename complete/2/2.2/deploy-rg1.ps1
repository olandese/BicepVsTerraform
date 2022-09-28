#!/usr/bin/env pwsh

$psParameters = @{
    Name              = "DeployToRG1-$((Get-Date).ToUniversalTime().ToString("yyyyMMddTHHmmssK"))"
    ResourceGroupName = 'rg-expertslive-bicep'
    TemplateFile      = '.\main-rg1.bicep'
    Verbose           = $true
    Mode              = 'Complete'
}

#Deploys the Azure Bicep template
New-AzResourceGroupDeployment @psParameters -WhatIf
