# Welcome  

This lab was specifically designed for the `Security Crash Course training`.  
Special thanks to [Sean Greenbaum](https://GitHub.com/SeanGreenbaum) for his assistance and initial code that made this possible.
<br><br>
# Overview

## Description

The below `Deploy to Azure` button will launch your Azure Portal with a template that will prompt you for some basic information. This will create a Network Security Group (NSG), Virtual Network, as well as multiple Virtual Machines (VMs). The Virtual Machine `DC1` will be promoted to a Domain Controller with the domain `contoso.com`, with the remaining Virtual Machines joining this domain.

The only information that you need to provide is the Resource Group that you would like this deployed to and the Administrative Password that you would like assigned to the Virtual Machines.

<br>

| Deploy LAB to Azure | Instructions | 
|:-------|:-------| 
|  [![Deploy LAB](https://docs.microsoft.com/en-us/azure/templates/media/deploy-to-azure.svg)](https://portal.azure.com/#blade/Microsoft_Azure_CreateUIDef/CustomDeploymentBlade/uri/https%3A%2F%2Fraw.githubusercontent.com%2FSteveHardee%2FCrashCourse%2Fmain%2FMain.json) |  [Deployment Instructions](https://github.com/SteveHardee/CrashCourse/blob/main/README.md#Instructions)

<br>

## Virtual Machines

|  VM Name | Operating System  |
| :--- | :------| 
| DC1 | Windows Server 2022 |
| Server2016 | Windows Server 2016 | 
| Server2008R2 | Windows Server 2008 R2 |
| Win10-Manual | Windows 10 | 
| Win10-GPO | Windows 10 | 
| Win10-Intune | Windows 10 | 
| Win7 | Windows 7 Enterprise |

<br>


## Domain Information
The Primary Domain Controller is `DC1`.<br>
The Domain Name is `contoso.com`<br>
The VMs will automatically be joined to the contoso.com domain.<br>
The Admin username is `AzureAdmin` <br>
The template will prompt you for the AzureAdmin password.



<br>
<br>

# Instructions 

After clicking the template, you will be brought to a Custom Deployment Template screen.
       

![01](https://raw.githubusercontent.com/SteveHardee/CrashCourse/main/artifacts/Images/InitialPrompt.png)<br><br>

- Confirm and/or select your appropriate Subscription
- Create a new resource group for this lab. 
    - Example: `Lab01`</b>
- Provide the Administrative Password for your VMs.
- Provide YOUR IP Address for the NSG Rules.
    - You can get your IP by going to ipchicken.com or whatismyip.com

          
<br><br>


# Licensing and access
These Virtual Machines (VMs) are being configured with the Azure Hybrid Benefit licensing. This requires you to license your Operating Systems (OS) per your existing Enterprise Agreement. The deployment makes use of Desired State Configuration for Virtual Machines. As part of this deployment, an artifact file (dc-build.ps1.zip) will be downloaded to the VMs to complete the Active Directory build. This means the VMs require access to the internet for the initial deployment. Specifically, it requires access to https://raw.githubusercontent.com.

<br><br>



<br><br>

---  

Steve Hardee
