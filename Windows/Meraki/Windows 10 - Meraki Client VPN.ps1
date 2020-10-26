<#
Script to enable Meraki Client VPN settings on Windows endpoints
Please replace values before pushing.
#>
$vpnnamn = 'Divido '
$vpnserver = 'REPLACEHOSTHERE'
$vpnkey = 'REPLACESHAREDKEYHERE'
$existingprofile = Get-VpnConnection -Name "$vpnnamn" -ea SilentlyContinue
 
if ($existingprofile -eq $null) {
    Add-VpnConnection -name $vpnnamn -ServerAddress $vpnserver -TunnelType L2tp -AuthenticationMethod mschapv2,Pap -RememberCredential -EncryptionLevel Required -L2tpPsk $vpnkey -force
    }