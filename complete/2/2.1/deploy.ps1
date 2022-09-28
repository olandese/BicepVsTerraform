#!/usr/bin/env pwsh

$psParameters = @{
    Name                   = "DeployMainSubscriptionLevel-$((Get-Date).ToUniversalTime().ToString("yyyyMMddTHHmmssK"))"
    TemplateFile           = '.\main-sub.bicep'
    location               = 'westeurope'
}

#Deploys the Azure Bicep template
New-AzDeployment @psParameters -WhatIf