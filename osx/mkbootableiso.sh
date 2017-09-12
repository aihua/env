#!/bin/bash  
# Convert InstallESD.dmg(macOS Sierra Image) to .iso
# Put it in /Applications/Install macOS Sierra.app directoroy and run it.

hdiutil attach ./Contents/SharedSupport/InstallESD.dmg -noverify -nobrowse -mountpoint /Volumes/install_app  
hdiutil convert /Volumes/install_app/BaseSystem.dmg -format UDSP -o ./Sierra  
hdiutil resize -size 8g ./Sierra.sparseimage  
hdiutil attach ./Sierra.sparseimage -noverify -nobrowse -mountpoint /Volumes/install_build  
rm -fr /Volumes/install_build/System/Installation/Packages  
cp -rp /Volumes/install_app/Packages /Volumes/install_build/System/Installation/  
cp -rp /Volumes/install_app/BaseSystem.chunklist /Volumes/install_build  
cp -rp /Volumes/install_app/BaseSystem.dmg /Volumes/install_build  
hdiutil detach /Volumes/install_app  
hdiutil detach /Volumes/install_build  
hdiutil resize -size `hdiutil resize -limits ./Sierra.sparseimage | tail -n 1 | awk '{ print $1 }'`b ./Sierra.sparseimage  
hdiutil convert ./Sierra.sparseimage -format UDTO -o /tmp/Sierra  
rm -fr ./Sierra.sparseimage  
#mv ./Sierra.cdr ~/Desktop/Sierra.iso  
hdiutil makehybrid -iso -joliet -o /tmp/Sierra.iso /tmp/Sierra.cdr
