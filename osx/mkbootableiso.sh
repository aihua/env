#!/bin/bash  
# Convert InstallESD.dmg(OS X El Capitan Image) to .iso
# Put it in /Applications/Install\ OS\ X\ El\ Capitan.app/ directory and run it.

hdiutil attach ./Contents/SharedSupport/InstallESD.dmg -noverify -nobrowse -mountpoint /Volumes/install_app  
hdiutil convert /Volumes/install_app/BaseSystem.dmg -format UDSP -o ./Capitan  
hdiutil resize -size 8g ./Capitan.sparseimage  
hdiutil attach ./Capitan.sparseimage -noverify -nobrowse -mountpoint /Volumes/install_build  
rm -fr /Volumes/install_build/System/Installation/Packages  
cp -rp /Volumes/install_app/Packages /Volumes/install_build/System/Installation/  
cp -rp /Volumes/install_app/BaseSystem.chunklist /Volumes/install_build  
cp -rp /Volumes/install_app/BaseSystem.dmg /Volumes/install_build  
hdiutil detach /Volumes/install_app  
hdiutil detach /Volumes/install_build  
hdiutil resize -size `hdiutil resize -limits ./Capitan.sparseimage | tail -n 1 | awk '{ print $1 }'`b ./Capitan.sparseimage  
hdiutil convert ./Capitan.sparseimage -format UDTO -o /tmp/Capitan  
rm -fr ./Capitan.sparseimage  
#mv ./Capitan.cdr ~/Desktop/Capitan.iso  
hdiutil makehybrid -iso -joliet -o /tmp/Capitan.iso /tmp/Capitan.cdr
