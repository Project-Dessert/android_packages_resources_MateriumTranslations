#!/bin/bash
set -e
declare -A dirs
TARGETPATH="$ANDROID_BUILD_TOP/packages/resources/MateriumTranslations"
###    Definitions     ###
dirs["Backgrounds"]="packages/apps/Backgrounds/res"
dirs["Settings"]="packages/apps/Settings/res"
dirs["core"]="frameworks/base/core/res/res"
dirs["SystemUI"]="frameworks/base/packages/SystemUI/res"
dirs["PackageInstaller"]="frameworks/base/packages/PackageInstaller/res"
dirs["SettingsLib"]="frameworks/base/packages/SettingsLib/res"
dirs["support"]="vendor/support/res"
### End of Definitions ###
for i in "${!dirs[@]}"; do
cp "$ANDROID_BUILD_TOP/${dirs[$i]}"/values/materium_strings.xml "$TARGETPATH/$i.xml"
done
git -C "$TARGETPATH" add .
git -C "$TARGETPATH" commit -m "[Automated] Pull translations"
