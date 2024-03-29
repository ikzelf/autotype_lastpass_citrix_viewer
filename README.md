# autotype_lastpass_citrix_viewer
inspired by keepass autotype aiming for Citrix Viewer windows

copy to your Library/Services/ directory
assign the workflow a keyboard shortcut that can be used from Citrix Viewer (I us FN-12)

from the terminal

Install lastpass-cli using: brew install lastpass-cli

login to your lastpass account using: lpass login --trust connect_your_lastpass_account

I closely followed these instructions to get it working: https://apple.stackexchange.com/questions/175215/how-do-i-assign-a-keyboard-shortcut-to-an-applescript-i-wrote

In the System Preferences/Security & Privacy allow the automator workflow to control your computer:<img width="662" alt="Screenshot 2022-01-13 at 13 24 45" src="https://user-images.githubusercontent.com/496774/149329858-6aa0878a-7336-482e-b6fe-094940bd2df5.png">

also for the Citrix Viewer application, that needs to be controlled.

Bartender is just a nice tool I use to keep my toplevel menu a bit organized. I can recommend it but it is not needed for this workflow.


open your citrix session and whenever you need a password that is stored in your lastpass vault hit your keyboard shortcut.
1) a list of passwords found for your screen name are found
2) the items are shown for you to check if all is OK
3) the items are shown in a chooser object so you can pick one that is needed
4) the choosen password is shown is an editable dialog so you can check and when needed edit it
5) the password from the editable dialog is typed in the citrix session - without an enter
6) you enter to use the password


This is my first applescript/ automator workflow. I am quite sure improvements are possible so if you see any: please feel free to share them, I am very open for pull requests and suggestions.


One thing that I would like is to change ```activate application "Citrix Viewer"``` to something with a variable instread of the hardcoded "Citrix Viewer". That would make this script a bit more usable for other apps.

Adjusted because I switched to M2 from intel. brew now installs in /opt/homebrew instead of /usr/local/bin. Time to source the .bash_profile instead of hardcoding the paths to lpass.
