<#
This Script fixes the issue with VPN on connecttions behind NAT
#>

New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\PolicyAgent" -Name "AssumeUDPEncapsulationContextOnSendRule" -Value 2  -PropertyType "DWord"