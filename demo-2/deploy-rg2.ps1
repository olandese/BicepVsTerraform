#!/usr/bin/env pwsh

$psParameters = @{
    Name				   = "DeployMainACR-$((Get-Date).ToUniversalTime().ToString("yyyyMMddTHHmmssK"))"
    ResourceGroupName	  = 'rg-bicep-vs-terraform'
    TemplateFile		   = '.\main-rg2.bicep'
    Mode				   = 'Complete'
}

#Deploys the Azure Bicep template
New-AzResourceGroupDeployment @psParameters -WhatIf
