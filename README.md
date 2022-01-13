# autotype_lastpass_citrix_viewer
inspired by keepass autotype aiming for Citrix Viewer windows

copy to your Library/Services/ directory
assign the workflow a keyboard shortcut that can be used from Citrix Viewer (I us FN-12)

from the terminal

Install lastpass-cli using: brew install lastpass-cli

login to your lastpass account using: lpass --trust connect your_lastpass_account

In the System Preferences/Security & Privacy allow the automator workflow to control your computer:<img width="662" alt="Screenshot 2022-01-13 at 12 54 02" src="https://user-images.githubusercontent.com/496774/149325740-4d0dbf37-63d4-4274-94a9-c90a922f1d38.png"> also for the AppleScript Utility and Automator


open your citrix session and whenever you need a password that is stored in your lastpass vault hit your keyboard shortcut.
1) a list of passwords found for your screen name are found
2) the items are shown for you to check if all is OK
3) the items are shown in a chooser object so you can pick one that is needed
4) the choosen password is shown is an editable dialog so you can check and when needed edit it
5) the password from the editable dialog is typed in the citrix session - without an enter
6) you enter to use the password


This is my first applescript/ automator workflow. I am quite sure improvements are possible so if you see any: please feel free to share them, I am very open for pull requests and suggestions.
