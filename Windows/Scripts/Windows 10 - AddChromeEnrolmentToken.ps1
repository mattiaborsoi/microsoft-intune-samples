<#
This Script pushes a Chrome Enterprise enrollment token.
Please update the value of the token before pushing
#>

New-Item -path "HKLM:\SOFTWARE\Policies\" -Name Google
New-Item -Path "HKLM:\SOFTWARE\Policies\Google" -Name Chrome
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Google\Chrome" -Name "CloudManagementEnrollmentToken" -Value "ENTERTHETOKENHERE"  -PropertyType "String"