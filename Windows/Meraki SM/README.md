Note: These instructions may differ based on the version of Windows used. For the most accurate instructions on removing a program, please refer to Microsoft Support.

If a Windows 10 management profile is installed, it can be removed from Windows Settings > Accounts > Work Access.

 

To uninstall the Systems Manager agent, use the Windows installer available under Systems Manager > Manage > Add Devices in Dashboard. If the installer is not available, the following steps may suffice:

On the device, navigate to Control Panel > Programs and Features.
Find the Meraki Systems Manager Agent in the list of programs, right-click and select Uninstall to remove from your system.
 

If you're unable to remove the agent through the programs list, a script similar to the following may be used from an elevated Command Prompt. Please note: you are deleting files and modifying registry keys at your own risk.

sc stop MerakiPCCAgent
sc stop MerakiVNCService

sc delete MerakiPCCAgent
sc delete MerakiVNCService
rd /s /q "C:\Program Files (x86)\Meraki\"
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Meraki /f