# Script to add apps to the Mac Dock

This script is am example showing how to use [Intune Shell Scripting](https://docs.microsoft.com/en-us/mem/intune/apps/macos-shell-scripts) to modify the macOS dock. In this instance the script has a list of apps that it waits to be present on the device before clearing the dock and adding the apps defined.

![Desktop Image](https://github.com/microsoft/shell-intune-samples/raw/master/img/desktop.png)

## Scenario

This scripts intended usage scenario is to be deployed during the initial app enrolment. It will wait until all of the apps are present before configuring the users dock.

The script searches for Apps listed in the DockItems array and once they are all present it adds them to the Dock in the order they appear in the list. Edit the list as appropriate for your use.

```
dockitems=( "/Applications/Google Chrome.app"
            "/Applications/Microsoft Word.app"
            "/Applications/Microsoft Excel.app"
            "/Applications/Slack.app"
            "/Applications/Microsoft Teams.app"
            "/Applications/1Password 7.app"
            "/Applications/Atom.app"
            "/Applications/Visual Studio Code.app"
            "/System/Applications/App Store.app"
            "/System/Applications/Utilities/Terminal.app"
            "/System/Applications/System Preferences.app")
```

>Note
>This is written in ZSH rather than bash. I'd love feedback on how to make this better.


## Script Settings

- Run script as signed-in user : Yes
- Hide script notifications on devices : Not configured
- Script frequency : Not configured
- Mac number of times to retry if script fails : 3
