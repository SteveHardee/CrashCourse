# Welcome  

Before deploying your lab, please read the instructions and understand the prerequisites, setup, licensing requirements, and parameters. Special thanks to [Sean Greenbaum](https://GitHub.com/SeanGreenbaum) for his assistance and initial code.
<br><br>
# Overview

## Description

The below `Deploy to Azure` button will launch your Azure Portal with a template that will prompt you for some basic information. This will create multiple Virtual Machines (VMs) for a lab environment and join them to the Active Directory domain.

<br>

| Deploy LAB to Azure | Instructions | 
|:-------|:-------| 
|  [![Deploy LAB](https://docs.microsoft.com/en-us/azure/templates/media/deploy-to-azure.svg)](https://portal.azure.com/#blade/Microsoft_Azure_CreateUIDef/CustomDeploymentBlade/uri/https%3A%2F%2Fraw.githubusercontent.com%2FSteveHardee%2FCrashCourse%2Fmain%2FMain.json) |  [Deployment Instructions](hhttps://github.com/SteveHardee/CrashCourse/blob/main/README.md#Instructions)

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
## **Prerequisites** 

This LAB Template will require that you provide a Resource Group (RG) and Virtual Network (VNET). <br>
It is recommended to build a new RG and VNET for this lab.<br>
<br>
The following will walk you through creating this.<br>
If you already have a new RG and VNET, [skip to the next step](https://github.com/SteveHardee/CrashCourse#execute-the-template) 


### Creating a new Resource Group and vNet

- Navigate to Portal.Azure.Com
    - Select Virtual Networks, create new Virtual Network
        - Select your desired subscription
        - Create a new resource group for this lab. 
            - Example: `Resource Group: Lab01`</b>
        - Name your Virtual Network
            - Example: `Virtual Network Name: Lab01-VNET`</b><br><br>
            ![01](https://raw.githubusercontent.com/SteveHardee/AzureVM/main/artifacts/images/CreateVirtualNetwork.png)<br><br>
        - Select `Next: Security >`
        - Select `Next: IP Addresses >`
            - Here is where you configure your IP Range and Subnet.
                - The script assumes this is set to the Subnet Name of `default` 
                - With an IP Address Range of `10.0.0.0 - 10.0.0.255` 
                <br>    
                *The script will ask you to confirm these before deploying*.<br><br>
            
            
                ![02](https://raw.githubusercontent.com/SteveHardee/AzureVM/main/artifacts/images/CreateSubnetRange.png)
                
                <br><br>
        - Select `Review + create`
        - Finally select `Create` <br>
<br>

*Wait for the new VNET to be created before proceeding*        


---





 <br>
 
 ### Execute the template
 - With our new resource group and network ready, we can now launch our template.
  
   [![Deploy LAB](https://docs.microsoft.com/en-us/azure/templates/media/deploy-to-azure.svg)](https://portal.azure.com/#blade/Microsoft_Azure_CreateUIDef/CustomDeploymentBlade/uri/https%3A%2F%2Fraw.githubusercontent.com%2FSteveHardee%2FCrashCourse%2Fmain%2FMain.json)

<br>

- Here we are prompted with our template.

    ![03](https://raw.githubusercontent.com/SteveHardee/AzureVM/main/artifacts/images/Template01.png)<br><br>

    This image shows us the default template when first launched.<br>

    - We will need to provide our resource group that we just created - `Lab01` 
    - Confirm the region that we want, by default this is `East US 2`
    - Confirm our VM Size, by default this is `Standard_D2as_v5`
    - Provide our VNET Name. This is the Virtual Network that we created in our [Prerequisites](https://github.com/SteveHardee/CrashCourse#prerequisites) section, which we used `Lab01-VNET`
    - Provide our VNET Subnet name, unless you changed this it will be the provided `default`
    - Provide our Domain Controllers IP Address, by default the script uses `10.0.0.4`
    - Finally, we need to provide the Administrators password for the VMs. This will set the `AzureAdmin` account password on the VMs.

    ![04](https://raw.githubusercontent.com/SteveHardee/AzureVM/main/artifacts/images/Template02.png)<br><br>
    


---- 
<br>

1. The template will build each VM
2. Generate the AD Domain Contoso.com
3. Join each VM to the Contoso.com domain.

<br>

   ![05](https://raw.githubusercontent.com/SteveHardee/AzureVM/main/artifacts/images/ADUC.png)<br><br>

    

 <br>
 



            






# Licensing and access
These Virtual Machines (VMs) are being configured with the Azure Hybrid Benefit licensing. This requires you to license your Operating Systems (OS) per your existing Enterprise Agreement. The deployment makes use of Desired State Configuration for Virtual Machines. As part of this deployment, an artifact file (dc-build.ps1.zip) will be downloaded to the VMs to complete the Active Directory build. This means the VMs require access to the internet for the initial deployment. Specifically, it requires access to https://raw.githubusercontent.com.

<br><br>



<br><br>

---  

Steve Hardee
