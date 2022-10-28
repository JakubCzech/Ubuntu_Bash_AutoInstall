############################################################################################
#       Version: 1.0                                                                       #
#       Software list: terminator, git, curl, rpi-imager, vscode, docker, docker-compose   #
#           slack, vlc, veracrypt, discord, brave, virtualbox, chrome, github desktop      #
############################################################################################

###     Update and upgrade
sudo apt update && sudo apt upgrade -y
###     Base packages install
sudo apt install -y terminator git vlc gdebi-core rpi-imager apt-transport-https ca-certificates lsb-release curl software-properties-common python3-pip python3-distutils tlp tlp-rdw xdg-desktop-portal-gnome sudo apt install qbittorrent net-tools
###     Snap packages 
sudo snap install bitwarden slack postman 
sudo snap install pycharm-educational --classic
###     Add repositories
# 7zip
sudo add-apt-repository universe
cd ~/Downloads
# Code 
wget -O- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg
echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list
# Balena
curl -1sLf 'https://dl.cloudsmith.io/public/balena/etcher/setup.deb.sh' | sudo -E bash
# Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# Veracrypt
sudo add-apt-repository ppa:unit193/encryption
# Guake 
sudo add-apt-repository ppa:linuxuprising/guake
# Yubico 
sudo add-apt-repository ppa:yubico/stable 
###     Update repositories
sudo apt update
apt-cache policy docker-ce
###     Software install
sudo apt install -y \
code docker-ce veracrypt brave-browser virtualbox \
virtualbox-ext-pack balena-etcher-electron guake \
p7zip-full p7zip-rar \
yubikey-manager yubikey-personalization-gui libpam-yubico libpam-u2f libpam-u2f

###     Docker add user to docker group
sudo usermod -aG docker ${USER}
su - ${USER}
###     Docker compose install
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
sudo chmod +x ~/.docker/cli-plugins/docker-compose
###     Download deb packages
cd /Downloads
# Github Desktop
wget https://github.com/shiftkey/desktop/releases/download/release-2.9.3-linux3/GitHubDesktop-linux-2.9.3-linux3.deb
# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
###     Install deb packages
sudo dpkg -i *.deb
### Cleanse
sudo apt autoremove
sudo tlp start
sudo systemctl enable tlp.service
