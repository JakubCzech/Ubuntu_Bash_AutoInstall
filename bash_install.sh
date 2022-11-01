############################################################################################
#       Version: 1.0                                                                       #
#       Software list: terminator, git, curl, rpi-imager, vscode, docker, docker-compose   #
#           slack, vlc, veracrypt, discord, brave, virtualbox, chrome, github desktop      #
############################################################################################

###     Update and upgrade
sudo apt update && sudo apt upgrade -y
sudo snap refresh 
###     Base packages install
sudo apt install -y \
  terminator \
  git \
  vlc \
  rpi-imager \
  apt-transport-https ca-certificates lsb-release curl software-properties-common \
  python3-pip python3-distutils \
  tlp tlp-rdw \
  xdg-desktop-portal-gnome \
  qbittorrent \
  net-tools \
  wireguard
###     Snap packages 
sudo snap install bitwarden 
sudo snap install slack
sudo snap install postman
sudo snap install brave
sudo snap install skype
sudo snap install discord
sudo snap install mailspring
sudo snap install mosquitto
sudo snap install pycharm-educational --classic
sudo snap install code --classic
###     Add repositories
cd ~/Downloads
sudo add-apt-repository universe # 7zip
curl -1sLf 'https://dl.cloudsmith.io/public/balena/etcher/setup.deb.sh' | sudo -E bash # Balena
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg # Docker
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo add-apt-repository ppa:unit193/encryption # Veracrypt
sudo add-apt-repository ppa:yubico/stable # Yubico
###     Update repositories
sudo apt update
apt-cache policy docker-ce
###     Software install
sudo apt install -y docker-ce
sudo apt install -y veracrypt
sudo apt install -y virtualbox
sudo apt install -y virtualbox-ext-pack
sudo apt install -y balena-etcher-electron
sudo apt install -y guake 
sudo apt install -y p7zip-full p7zip-rar 
sudo apt install -y yubikey-manager libpam-yubico libpam-u2f libpam-u2f

###     Docker add user to docker group
sudo groupadd docker
sudo usermod -aG docker ${USER}
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
