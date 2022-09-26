#!/usr/bin/env pwsh

$psParameters = @{
    Name                   = "DeployMainBicepRG-$((Get-Date).ToUniversalTime().ToString("yyyyMMddTHHmmssK"))"
    TemplateFile           = '.\main.bicep'
    location               = 'westeurope'
}

#Deploys the Azure Bicep template
New-AzDeployment @psParameters -WhatIf