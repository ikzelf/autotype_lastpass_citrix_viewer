# activated with a citrix viewer window as front window using a keyboard shortcut
# finds the name of that window
# and searches for a group in the lastpass vault that matches that window name
# the idea is that this prevents having to hard code group names in the script
#
# the list of found items is shown
# the chosen password is shown in an editable dialog
# the string from the editable dialog is written to the front most window, without an enter
#
# depends on lpass that can/should be installed using brew install lastpass-cli
# https://github.com/lastpass/lastpass-cli
# first run lpass connect --trus your_lastpass_account from the terminal
# (C) Ronald Rood - 2022, 2023
# uses ~/.bash_profile t. set PATH

on FileExists(theFile) -- (String) as Boolean
	tell application "System Events"
		if exists file theFile then
			return true
		else
			return false
		end if
	end tell
end FileExists

tell application "System Events"
	set frontAppProcess to first application process whose frontmost is true
	set frontAppName to name of frontAppProcess
	# display dialog frontAppName
	# get title of top citrix viewer window
	tell process frontAppName
		tell (1st window whose value of attribute "AXMain" is true)
			set windowTitle to value of attribute "AXTitle"
		end tell
	end tell
	# display dialog windowTitle
	
	
	try
		set debugaction to "check status: first run 
lpass login --trust your_lastpass_account
... from the terminal"
		set connected_name to do shell script ". ~/.bash_profile;lpass status"
		
		set debugaction to "list groep"
		# get the items from the group and strip out the groupname from the list and delete the header line
		set lijstje to (do shell script ". ~/.bash_profile;lpass ls '" & windowTitle & "'|sed 's!" & windowTitle & "!!g'| sed 1d")
		# the sed line above asumes there won't be a "!" in the windowTitle
		
		display dialog connected_name & " " & windowTitle & "
		
" & lijstje default button ("OK")
		
		set keuzelijstje to paragraphs of lijstje
		set debugaction to "choose pwd item"
		try
			set de_keuze to choose from list keuzelijstje with prompt "Select pwd item:"
		on error
			return
		end try
		
		set debugaction to "get ID uit " & de_keuze
		set gekozen_ID to do shell script "awk '{print substr($NF, 1, length($NF)-1)}'<<<" & quoted form of (item 1 of de_keuze)
		
		set debugaction to "get pwd van ID: " & gekozen_ID
		set pwd to do shell script ". ~/.bash_profile;lpass show " & gekozen_ID & " --password"
		
		# eventually preview and edit before typing instead of directly set texttosay to pwd:
		# display dialog "pwd to type:" default answer pwd
		# set texttosay to the text returned of the result
		set texttosay to pwd
		
		activate application "Citrix Viewer"
		try
			keystroke texttosay
		on error errMsg number errorNumber
			display dialog errMsg & " :  " & errorNumber as text
		end try
		
	on error errMsg number errorNumber
		display dialog debugaction & " : " & errMsg
	end try
	
end tell
