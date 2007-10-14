-- Loader 2 Installer.applescript
-- Loader 2 Installer

--  Created by Ari on 10/12/07.
--  Copyright 2007 WinX Scripts. All rights reserved.

on clicked theObject
	tell application "Finder"
		if not (exists "/Applications/iJailBreak" as POSIX file) then
			display dialog "Please put the iJailBreak folder into your Applications folder before installing"
			do shell script "killall iJailBreak"
		end if
	end tell
	set theReply to display dialog "Press OK to start the jailbreak process."
	tell window "MainMenu"
		set the visible of button "iphone" to false
		set the visible of button "install" to false
		set the visible of progress indicator "progress" to true
		tell progress indicator "progress" to start
	end tell
	tell window "MainMenu"
		set the contents of text field "text" to "Installing iPhuc and Readline..."
	end tell
	tell application "Finder"
		if not (exists file "/opt/local/lib/libreadline.5.2.dylib" as POSIX file) then
			set readline to "true"
		else
			set readline to "false"
		end if
	end tell
	if readline is "true" then do shell script "mkdir /opt && mkdir /opt/local && mkdir /opt/local/lib && cp /Applications/iJailBreak/resources/readline/libreadline.5.2.dylib /opt/local/lib/" with administrator privileges
	tell window "MainMenu"
		set the contents of text field "text" to "Jailbreaking... This step will take a while."
	end tell
	display dialog "First, on your iPod, navigate to http://jailbreak.toc2rta.com/. Once Safari crashes, connect your iPod and press OK."
	do shell script ("cd /Applications/iJailBreak/resources/iphuc/ && ./iphuc -qs ./getfile")
	do shell script ("mv /Applications/iJailBreak/resources/iphuc/iphonefs/rdisk0s1 /Applications/iJailBreak/resources/iphuc/iphonefs/rdisk0s1.dmg")
	do shell script ("hdiutil attach /Applications/iJailBreak/resources/iphuc/iphonefs/rdisk0s1.dmg -mount required")
	do shell script ("rm /Volumes/Snowbird3A110a.N45Bundle/private/etc/fstab && cp /Applications/iJailBreak/resources/iphuc/fstab /Volumes/Snowbird3A110a.N45Bundle/private/etc/")
	do shell script ("mkdir /Volumes/Snowbird3A110a.N45Bundle/Applications/Installer.app/ && cp -R /Applications/iJailBreak/resources/Installer.app/* /Volumes/Snowbird3A110a.N45Bundle/Applications/Installer.app/")
	do shell script ("mkdir /Volumes/Snowbird3A110a.N45Bundle/private/var/root/ && mkdir /Volumes/Snowbird3A110a.N45Bundle/private/var/root/Library/ && mkdir /Volumes/Snowbird3A110a.N45Bundle/private/var/root/Library/Installer/ && cp -R /Applications/iJailBreak/resources/Installer/* /Volumes/Snowbird3A110a.N45Bundle/private/var/root/Library/Installer/")
	do shell script ("hdiutil unmount '/Volumes/Snowbird3A110a.N45Bundle' -force")
	do shell script ("cd /Applications/iJailBreak/resources/iphuc/ && ./iphuc -qs ./putfile")
	display dialog "Restart your iPod by holding down the power button until the red slider appears. Slide the slider, then once it turns off turn it back on. Once it's fully on, press OK."
	tell window "MainMenu"
		set the contents of text field "text" to "Installing SSH..."
	end tell
	do shell script ("cd /Applications/iJailBreak/resources/ssh/ && ./iphuc -qs ./iphucscript")
	display dialog "Please reboot your iPod again like last time, and press OK when it's fully booted"
	tell window "MainMenu"
		set the contents of text field "text" to "Installing Springboard..."
	end tell
	do shell script ("cd /Applications/iJailBreak/resources/ssh/ && ./iphuc -qs ./iphucscript2")
	do shell script ("sleep 10")
	display dialog "Please reboot your iPod yet another time. Once it's booted it will automatically restart, after that press OK. "
	do shell script ("cd /Applications/iJailBreak/resources/iphuc/iphonefs/ && rm rdisk0s1.dmg")
	tell window "MainMenu"
		set the visible of button "iphone" to true
		set the visible of button "install" to true
		tell progress indicator "progress" to stop
		set the visible of progress indicator "progress" to false
		set the contents of text field "text" to "Welcome to the iJailBreak Utility. Press a button to begin."
	end tell
end clicked