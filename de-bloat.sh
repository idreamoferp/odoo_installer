sudo apt purge bb-beaglebone-io-installer bb-johnny-five-installer bb-node-red-installer -y
sudo apt purge bluetooth -y
sudo apt purge apache2 apache2-bin apache2-data apache2-utils -y
sudo apt purge libvtk6.3 -y
sudo apt purge fonts-noto-cjk breeze-cursor-theme -y
sudo apt purge libpython2.7-dev -y
sudo apt purge chromium -y
sudo apt purge x11-common x11proto-core-dev gconf2 gconf2-common gcr gksu gnome-accessibility-themes gnome-keyring gnupg gnupg-agent gsettings-desktop-schem$
sudo apt purge python3.5 python3-minimal python3.5-minimal -y
sudo apt purge vim vim-common vim-runtime vim-tiny -y
sudo apt purge x11proto-core-dev x11proto-input-dev x11proto-kb-dev -y --fix-missing
sudo apt purge fontconfig fontconfig-config fonts-dejavu-core fonts-liberation fonts-noto-hinted fonts-noto-mono -y
sudo apt autoremove -y
sudo apt clean

