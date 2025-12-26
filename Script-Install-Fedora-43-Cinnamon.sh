#!/bin/bash

echo ---------------------------------------------
echo ---- UPGRADE REFRESH ------------------------
echo ---------------------------------------------
sudo dnf update -y
sudo dnf upgrade --refresh -y


echo ---------------------------------------------
echo ---- Les modèles ----------------------------
echo ---------------------------------------------

# 1. Créer un fichier texte vide
touch ~/Modèles/"Fichier.txt"

# 2. Créer un script bash simple
echo -e '#!/bin/bash' > ~/Modèles/"Script.sh"
chmod +x ~/Modèles/"Script.sh"

# 3. Créer un document docx vide
touch ~/Modèles/"Document.docx"


echo ---------------------------------------------
echo ---- RPM Fusion -----------------------------
echo ---------------------------------------------

sudo dnf install -y \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-43.noarch.rpm \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-43.noarch.rpm


echo ---------------------------------------------
echo ---- NVidia /Vulkan -------------------------
echo ---------------------------------------------

sudo dnf remove "*nvidia*" "*cuda*" "*akmod*" 
sudo dnf install -y akmod-nvidia xorg-x11-drv-nvidia-cuda
sudo dnf install xorg-x11-drv-nvidia-cuda-libs nvidia-settings nvidia-persistenced -y
sudo akmods --force
sudo dracut --force

#sudo dnf install -y akmod-nvidia xorg-x11-drv-nvidia-cuda
sudo dnf install -y vulkan vulkan-tools vulkan-loader vulkan-loader.i686 vulkan-validation-layers mesa-vulkan-drivers mesa-vulkan-drivers.i686


echo ---------------------------------------------
echo ---- Outils de base -------------------------
echo ---------------------------------------------

sudo dnf install -y vim nano htop neofetch curl wget unzip p7zip gnome-tweaks flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo dnf install snapd

sudo dnf install -y mangohud vkbasalt gamemode
sudo dnf install -y wine
sudo dnf install -y numlockx
sudo dnf install -y steam lutris mangohud gamemode

sudo dnf install -y exfatprogs ntfs-3g

sudo dnf install alien -y

echo ---------------------------------------------
echo ---- Companion ------------------------------
echo ---------------------------------------------

curl -sSLf https://github.com/aclap-dev/vdhcoapp/releases/latest/download/install.sh | bash


echo ---------------------------------------------
echo ---- Installation SNAP ----------------------
echo ---------------------------------------------
sudo snap install snap-store
sudo snap install whatsapp-linux-app
sudo snap install sublime-text --classic

echo ---------------------------------------------
echo ---- Installation FLATHUB -------------------
echo ---------------------------------------------
flatpak install flathub com.github.jeromerobert.pdfarranger -y
flatpak install flathub com.github.unrud.VideoDownloader -y
flatpak install flathub com.ultimaker.cura -y
flatpak install flathub io.github.jotd666.gods-deluxe -y
flatpak install flathub com.belmoussaoui.Authenticator -y
flatpak install flathub org.freecad.FreeCAD -y
flatpak install flathub com.vysp3r.ProtonPlus -y
flatpak install flathub org.tordini.flavio.Minitube -y
flatpak install flathub com.unicornsonlsd.finamp -y
flatpak install flathub fr.handbrake.ghb -y
flatpak install flathub com.anydesk.Anydesk -y
flatpak install flathub org.jdownloader.JDownloader -y
flatpak install flathub org.filezillaproject.Filezilla -y
flatpak install flathub io.github.shiftey.Desktop -y
flatpak install flathub com.ktechpit.ultimate-media-downloader -y
flatpak install flathub com.fastmail.Fastmail -y
flatpak install flathub com.todoist.Todoist -y
flatpak install flathub org.gnome.Notes -y
flatpak install flathub com.albiononline.AlbionOnline -y
flatpak install flathub org.kde.krename -y
flatpak install flathub org.kde.amarok -y
flatpak install flathub com.bitwarden.desktop -y


echo ---------------------------------------------
echo ---- Nettoyage  -----------------------------
echo ---------------------------------------------
sudo dnf autoremove
sudo dnf clean all  



