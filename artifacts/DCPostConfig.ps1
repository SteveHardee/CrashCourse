param (
    [Parameter(Mandatory=$false)][string]$Password = "P@ssword1"
)

#Download GPOs and Import them

$localdownloadpath = "C:\Labs"
$downloadURL = "https://github.com/SteveHardee/CrashCourse/raw/main/artifacts/BadGPO.zip"
$filename = $downloadURL.Substring($downloadURL.LastIndexOf("/")+1)
$fullpath = $localdownloadpath + "\" + $filename
$extractedpath = $localdownloadpath + "\" + $filename.Split('.')[0]

if (-not (Test-path $localdownloadpath))
{
    New-Item -Path $localdownloadpath -ItemType Directory
}
Invoke-WebRequest -Uri $downloadURL -OutFile $fullpath
Unblock-File -Path $fullpath
Expand-Archive -Path $fullpath -DestinationPath $extractedpath

$GPOGuids = Get-ChildItem -path $extractedpath
ForEach ($gpoguid in $GPOGuids)
{
    $myguid = $gpoguid.Name.Replace("{","").Replace("}","")
    $mycontent = Get-Content -Path ($gpoguid.FullName + "\bkupInfo.xml")
    $myGPOName = $mycontent.Substring($mycontent.LastIndexOf("[")+1).split(']')[0]
    Import-GPO -BackupId $myguid -TargetName $myGPOName -CreateIfNeeded -Path $extractedpath
}


#Create user objects
$AdminOU = "OU=Tier 0,OU=Admin,DC=contoso,DC=com"
$PeopleOU = "OU=People,OU=contoso,DC=contoso,DC=com"
$ServiceAccountOU = "OU=Service Accounts,OU=contoso,DC=contoso,DC=com"

$SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
#Create Sean domain admin account
New-ADUser -Name "Sean Admin" -SamAccountName "Sean" -UserPrincipalName "sean@contoso.com" -PasswordNeverExpires $true -Path $AdminOU
Set-ADAccountPassword sean -Reset -NewPassword $SecurePassword
Set-ADUser sean -ChangePasswordAtLogon $false -PasswordNotRequired $false -Enabled $True
Add-ADGroupMember -Identity "Domain Admins" -Members sean

#Create Steve user account
New-ADUser -Name "Steve User" -SamAccountName "Steve" -UserPrincipalName "steve@contoso.com" -PasswordNeverExpires $true -Path $PeopleOU
Set-ADAccountPassword steve -Reset -NewPassword $SecurePassword
Set-ADUser steve -ChangePasswordAtLogon $false -PasswordNotRequired $false -Enabled $True

#Create SQL Service account
New-ADUser -Name "SQL Service Account" -SamAccountName "svc-sql1" -UserPrincipalName "svc-sql1@contoso.com" -PasswordNeverExpires $true -Path $ServiceAccountOU -Description "Secret password P@ssword12345. Do not share!"
Set-ADAccountPassword svc-sql1 -Reset -NewPassword (ConvertTo-SecureString "P@ssword12345" -AsPlainText -Force)
Set-ADUser svc-sql1 -ChangePasswordAtLogon $false -PasswordNotRequired $false -Enabled $True
