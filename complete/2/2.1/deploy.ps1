#!/usr/bin/env pwsh

$psParameters = @{
    Name                   = 'DeployBicepRG'
    TemplateFile           = '.\main.bicep'
    location               = 'westeurope'
}

#Deploys the Azure Bicep template
New-AzDeployment @psParameters -WhatIf