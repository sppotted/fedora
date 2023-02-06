#!/bin/bash

# CREDITS
# @Ahmad Ismail
# https://unix.stackexchange.com/questions/617288/command-line-tool-to-install-gnome-shell-extensions

flatpak install ExtensionManager -y

array=( https://extensions.gnome.org/extension/3193/blur-my-shell/
https://extensions.gnome.org/extension/3843/just-perfection/
https://extensions.gnome.org/extension/779/clipboard-indicator/
https://extensions.gnome.org/extension/1180/freon/
https://extensions.gnome.org/extension/545/hide-top-bar/
https://extensions.gnome.org/extension/5099/hot-bottom/
https://extensions.gnome.org/extension/750/openweather/
https://extensions.gnome.org/extension/5446/quick-settings-tweaker/
https://extensions.gnome.org/extension/2986/runcat/
https://extensions.gnome.org/extension/3733/tiling-assistant/
https://extensions.gnome.org/extension/701/top-panel-workspace-scroll/
https://extensions.gnome.org/extension/2890/tray-icons-reloaded/
https://extensions.gnome.org/extension/1287/unite/
https://extensions.gnome.org/extension/5177/vertical-workspaces/ )

for i in "${array[@]}"
do
    EXTENSION_ID=$(curl -s $i | grep -oP 'data-uuid="\K[^"]+')
    VERSION_TAG=$(curl -Lfs "https://extensions.gnome.org/extension-query/?search=$EXTENSION_ID" | jq '.extensions[0] | .shell_version_map | map(.pk) | max')
    wget -O ${EXTENSION_ID}.zip "https://extensions.gnome.org/download-extension/${EXTENSION_ID}.shell-extension.zip?version_tag=$VERSION_TAG"
    gnome-extensions install --force ${EXTENSION_ID}.zip
    if ! gnome-extensions list | grep --quiet ${EXTENSION_ID}; then
        busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s ${EXTENSION_ID}
    fi
    gnome-extensions enable ${EXTENSION_ID}
    rm ${EXTENSION_ID}.zip
done
