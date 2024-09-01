#!/bin/bash

# Color
BLUE='\033[0;34m'       
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'
warning(){
    echo -e '\e[31m'"$1"'\e[0m';

}
# Display welcome message
display_welcome() {
  echo -e ""
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${RED}[+]                                                 [+]${NC}"
  echo -e "${RED}[+]                AUTO INSTALLER THEMA             [+]${NC}"
  echo -e "${RED}[+]                © GARAXYZ - ASSISTEN             [+]${NC}"
  echo -e "${RED}[+]                                                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e ""
  echo -e "script ini di buat untuk mempermudah penginstalasian thema pterodactyle,"
  echo -e "dilarang keras untuk memperjual belikan."
  echo -e ""
  echo -e "𝗪𝗛𝗔𝗧𝗦𝗔𝗣𝗣 :"
  echo -e "0877-8633-6665"
  echo -e "𝗬𝗢𝗨𝗧𝗨𝗕𝗘 :"
  echo -e "@Fahriofficial"
  echo -e "𝗖𝗥𝗘𝗗𝗜𝗧𝗦 :"
  echo -e "@GaraXyz - Assisten"
  sleep 4
  clear
}

#Update and install jq
install_jq() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]             UPDATE & INSTALL JQ                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sudo apt update && sudo apt install -y jq
  if [ $? -eq 0 ]; then
    echo -e "                                                       "
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "${GREEN}[+]              INSTALL JQ BERHASIL                [+]${NC}"
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
  else
    echo -e "                                                       "
    echo -e "${RED}[+] =============================================== [+]${NC}"
    echo -e "${RED}[+]              INSTALL JQ GAGAL                   [+]${NC}"
    echo -e "${RED}[+] =============================================== [+]${NC}"
    exit 1
  fi
  echo -e "                                                       "
  sleep 1
  clear
}
#Check user token
check_token() {
  echo -e "                                                       "
  echo -e "${RED}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]             LICENSY GARAXYZ - ASSISTEN          [+]${NC}"
  echo -e "${RED}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  echo -e "${YELLOW}MASUKAN AKSES TOKEN :${NC}"
  read -r USER_TOKEN

  if [ "$USER_TOKEN" = "fahristock" ]; then
    echo -e "${GREEN}AKSES BERHASIL${NC}}"
  else
    echo -e "${GREEN}Buy dulu Weh Ke GaraXyz - Assisten No 6287786336665${NC}"
    exit 1
  fi
  clear
}

# Install theme
install_theme() {
  while true; do
    echo -e "                                                       "
    echo -e "${BLUE}[+] =============================================== [+]${NC}"
    echo -e "${BLUE}[+]                   SELECT THEME                  [+]${NC}"
    echo -e "${BLUE}[+] =============================================== [+]${NC}"
    echo -e "                                                       "
    echo -e "PILIH THEME YANG INGIN DI INSTALL"
    echo "1. stellar"
    echo "2. billing"
    echo "3. enigma"
    echo "x. kembali"
    echo -e "masukan pilihan (1/2/3/x) :"
    read -r SELECT_THEME
    case "$SELECT_THEME" in
      1)
        THEME_URL=$(echo -e "https://github.com/Fahrihosting1/theme/raw/main/C2.zip")
        break
        ;;
      2)
        THEME_URL=$(echo -e "\x68\x74\x74\x70\x73\x3A\x2F\x2F\x67\x69\x74\x68\x75\x62\x2E\x63\x6F\x6D\x2F\x44\x49\x54\x5A\x5A\x31\x31\x32\x2F\x66\x6F\x78\x78\x68\x6F\x73\x74\x74\x2F\x72\x61\x77\x2F\x6D\x61\x69\x6E\x2F\x43\x31\x2E\x7A\x69\x70")
        break
        ;;
      3)
        THEME_URL=$(echo -e "\x68\x74\x74\x70\x73\x3A\x2F\x2F\x67\x69\x74\x68\x75\x62\x2E\x63\x6F\x6D\x2F\x44\x49\x54\x5A\x5A\x31\x31\x32\x2F\x66\x6F\x78\x78\x68\x6F\x73\x74\x74\x2F\x72\x61\x77\x2F\x6D\x61\x69\x6E\x2F\x43\x33\x2E\x7A\x69\x70")
        break
        ;; 
      x)
        return
        ;;
      *)
        echo -e "${RED}Pilihan tidak valid, silahkan coba lagi.${NC}"
        ;;
    esac
  done
  
if [ -e /root/pterodactyl ]; then
    sudo rm -rf /root/pterodactyl
  fi
  wget -q "$THEME_URL"
  sudo unzip -o "$(basename "$THEME_URL")"
  
if [ "$SELECT_THEME" -eq 1 ]; then
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                  INSTALLASI THEMA               [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                                   "
  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt install -y nodejs
  sudo npm i -g yarn
  cd /var/www/pterodactyl
  yarn add react-feather
  php artisan migrate
  yarn build:production
  php artisan view:clear
  sudo rm /root/C2.zip
  sudo rm -rf /root/pterodactyl

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                   INSTALL SUCCESS               [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e ""
  sleep 2
  clear
  exit 0

elif [ "$SELECT_THEME" -eq 2 ]; then
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                  INSTALLASI THEMA               [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt install -y nodejs
  npm i -g yarn
  cd /var/www/pterodactyl
  yarn add react-feather
  php artisan billing:install stable
  php artisan migrate
  yarn build:production
  php artisan view:clear
  sudo rm /root/C1.zip
  sudo rm -rf /root/pterodactyl

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                  INSTALL SUCCESS                [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  return

elif [ "$SELECT_THEME" -eq 3 ]; then
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                  INSTALLASI THEMA               [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                                   "

    # Menanyakan informasi kepada pengguna untuk tema Enigma
    echo -e "${YELLOW}Masukkan link wa (https://wa.me...) : ${NC}"
    read LINK_WA
    echo -e "${YELLOW}Masukkan link group (https://.....) : ${NC}"
    read LINK_GROUP
    echo -e "${YELLOW}Masukkan link channel (https://...) : ${NC}"
    read LINK_CHNL

    # Mengganti placeholder dengan nilai dari pengguna
    sudo sed -i "s|LINK_WA|$LINK_WA|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    sudo sed -i "s|LINK_GROUP|$LINK_GROUP|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    sudo sed -i "s|LINK_CHNL|$LINK_CHNL|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    

  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt install -y nodejs
  sudo npm i -g yarn
  cd /var/www/pterodactyl
  yarn add react-feather
  php artisan migrate
  yarn build:production
  php artisan view:clear
  sudo rm /root/C3.zip
  sudo rm -rf /root/pterodactyl

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                   INSTALL SUCCESS               [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e ""
  sleep 5
else
  echo ""
  echo "Pilihan tidak valid. silahkan pilih 1/2/3."
fi
}


# Uninstall theme
uninstall_theme() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                    DELETE THEME                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  bash <(curl https://raw.githubusercontent.com/VallzHost/installer-theme/main/repair.sh)
  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                 DELETE THEME SUKSES             [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
}
install_themeEnigma() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                  INSTALLASI THEMA               [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                                   "

    # Menanyakan informasi kepada pengguna untuk tema Enigma
    echo -e "${YELLOW}Masukkan link wa (https://wa.me...) : ${NC}"
    read LINK_WA
    echo -e "${YELLOW}Masukkan link group (https://.....) : ${NC}"
    read LINK_GROUP
    echo -e "${YELLOW}Masukkan link channel (https://...) : ${NC}"
    read LINK_CHNL

    # Mengganti placeholder dengan nilai dari pengguna
    sudo sed -i "s|LINK_WA|$LINK_WA|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    sudo sed -i "s|LINK_GROUP|$LINK_GROUP|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    sudo sed -i "s|LINK_CHNL|$LINK_CHNL|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    

  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt install -y nodejs
  sudo npm i -g yarn
  cd /var/www/pterodactyl
  yarn add react-feather
  php artisan migrate
  yarn build:production
  php artisan view:clear
  sudo rm /root/C3.zip
  sudo rm -rf /root/pterodactyl

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                   INSTALL SUCCESS               [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e ""
  sleep 5
clear
exit 0
}
install_themeSteeler() {
#!/bin/bash
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                  INSTALLASI THEMA               [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                                   "
  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt install -y nodejs
  sudo npm i -g yarn
  cd /var/www/pterodactyl
  yarn add react-feather
  php artisan migrate
  yarn build:production
  php artisan view:clear
  sudo rm /root/C2.zip
  sudo rm -rf /root/pterodactyl

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                   INSTALL SUCCESS               [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e ""
  sleep 2
  clear
  exit 0
  
}
create_node() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                    CRRATE NODE                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  #!/bin/bash
#!/bin/bash

# Minta input dari pengguna
read -p "Masukkan nama lokasi: " location_name
read -p "Masukkan deskripsi lokasi: " location_description
read -p "Masukkan domain: " domain
read -p "Masukkan nama node: " node_name
read -p "Masukkan RAM (dalam MB): " ram
read -p "Masukkan jumlah maksimum disk space (dalam MB): " disk_space
read -p "Masukkan Locid: " locid

# Ubah ke direktori pterodactyl
cd /var/www/pterodactyl || { echo "Direktori tidak ditemukan"; exit 1; }

# Membuat lokasi baru
php artisan p:location:make <<EOF
$location_name
$location_description
EOF

# Membuat node baru
php artisan p:node:make <<EOF
$node_name
$location_description
$locid
https
$domain
yes
no
no
$ram
$ram
$disk_space
$disk_space
100
8080
2022
/var/lib/pterodactyl/volumes
EOF

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                 CREATE NODE & LOCATION SUKSES             [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  exit 0
}
uninstall_panel() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                    UNINSTALL PANEL                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "


bash <(curl -s https://pterodactyl-installer.se) <<EOF
y
y
y
y
EOF


  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                 UNINSTALL PANEL SUKSES             [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  exit 0
}
### PHPMyAdmin Installation ###

phpmyadmin(){
    apt install dnsutils -y
    echo ""
    echo "[!] Before installation, we need some information."
    echo ""
    phpmyadmin_fqdn
}

phpmyadmin_finish(){
    cd
    echo -e "PHPMyAdmin Installation\n\nSummary of the installation\n\nPHPMyAdmin URL: $PHPMYADMIN_FQDN\nPreselected webserver: NGINX\nSSL: $PHPMYADMIN_SSLSTATUS\nUser: $PHPMYADMIN_USER_LOCAL\nPassword: $PHPMYADMIN_PASSWORD\nEmail: $PHPMYADMIN_EMAIL" > phpmyadmin_credentials.txt
    clear
    echo "[!] Installation of PHPMyAdmin done"
    echo ""
    echo "    Summary of the installation" 
    echo "    PHPMyAdmin URL: $PHPMYADMIN_FQDN"
    echo "    Preselected webserver: NGINX"
    echo "    SSL: $PHPMYADMIN_SSLSTATUS"
    echo "    User: $PHPMYADMIN_USER_LOCAL"
    echo "    Password: $PHPMYADMIN_PASSWORD"
    echo "    Email: $PHPMYADMIN_EMAIL"
    echo ""
    echo "    These credentials will has been saved in a file called" 
    echo "    phpmyadmin_credentials.txt in your current directory"
    echo ""
}


phpmyadminweb(){
    rm -rf /etc/nginx/sites-enabled/default || exit || echo "An error occurred. NGINX is not installed." || exit
    apt install mariadb-server -y
    PHPMYADMIN_PASSWORD=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1`
    mariadb -u root -e "CREATE USER '$PHPMYADMIN_USER_LOCAL'@'localhost' IDENTIFIED BY '$PHPMYADMIN_PASSWORD';" && mariadb -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$PHPMYADMIN_USER_LOCAL'@'localhost' WITH GRANT OPTION;"
    
    if  [ "$PHPMYADMIN_SSLSTATUS" =  "true" ]; then
        rm -rf /etc/nginx/sites-enabled/default
        curl -o /etc/nginx/sites-enabled/phpmyadmin.conf https://raw.githubusercontent.com/Fahrihosting1/thema/main/configs/phpmyadmin-ssl.conf
        sed -i -e "s@<domain>@${PHPMYADMIN_FQDN}@g" /etc/nginx/sites-enabled/phpmyadmin.conf
        systemctl stop nginx || exit || echo "An error occurred. NGINX is not installed." || exit
        certbot certonly --standalone -d $PHPMYADMIN_FQDN --staple-ocsp --no-eff-email -m $PHPMYADMIN_EMAIL --agree-tos || exit || echo "An error occurred. Certbot not installed." || exit
        systemctl start nginx || exit || echo "An error occurred. NGINX is not installed." || exit
        phpmyadmin_finish
        fi
    if  [ "$PHPMYADMIN_SSLSTATUS" =  "false" ]; then
        curl -o /etc/nginx/sites-enabled/phpmyadmin.conf https://raw.githubusercontent.com/Fahrihosting1/thema/main/configs/phpmyadmin.conf || exit || echo "An error occurred. cURL is not installed." || exit
        sed -i -e "s@<domain>@${PHPMYADMIN_FQDN}@g" /etc/nginx/sites-enabled/phpmyadmin.conf || exit || echo "An error occurred. NGINX is not installed." || exit
        systemctl restart nginx || exit || echo "An error occurred. NGINX is not installed." || exit
        phpmyadmin_finish
        fi
}

phpmyadmin_fqdn(){
    send_phpmyadmin_summary
    echo "[!] Please enter FQDN. You will access PHPMyAdmin with this."
    read -r PHPMYADMIN_FQDN
    [ -z "$PHPMYADMIN_FQDN" ] && echo "FQDN can't be empty."
    IP=$(dig +short myip.opendns.com @resolver2.opendns.com -4)
    DOMAIN=$(dig +short ${PHPMYADMIN_FQDN})
    if [ "${IP}" != "${DOMAIN}" ]; then
        echo ""
        echo "Your FQDN does not resolve to the IP of this machine."
        echo "Continuing anyway in 10 seconds.. CTRL+C to stop."
        sleep 10s
        phpmyadmin_ssl
    else
        phpmyadmin_ssl
    fi
}

phpmyadmininstall(){
    apt update
    apt install nginx certbot -y
    mkdir /var/www/phpmyadmin && cd /var/www/phpmyadmin || exit || echo "An error occurred. Could not create directory." || exit
    cd /var/www/phpmyadmin
    if  [ "$dist" =  "ubuntu" ] && [ "$version" = "20.04" ]; then
        apt -y install software-properties-common curl apt-transport-https ca-certificates gnupg
        LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
        curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup |  bash
        apt update
         add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
    fi
    if [ "$dist" = "debian" ] && [ "$version" = "11" ]; then
        apt -y install software-properties-common curl ca-certificates gnupg2  lsb-release
        echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" |  tee /etc/apt/sources.list.d/sury-php.list
        curl -fsSL  https://packages.sury.org/php/apt.gpg |  gpg --dearmor -o /etc/apt/trusted.gpg.d/sury-keyring.gpg
        apt update -y
        curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup |  bash
    fi
    if [ "$dist" = "debian" ] && [ "$version" = "12" ]; then
        apt -y install software-properties-common curl ca-certificates gnupg2  lsb-release
         apt install -y apt-transport-https lsb-release ca-certificates wget
        wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
        echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" |  tee /etc/apt/sources.list.d/php.list
        apt update -y
        curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup |  bash
    fi
    
    wget https://files.phpmyadmin.net/phpMyAdmin/5.2.1/phpMyAdmin-5.2.1-all-languages.tar.gz
    tar xzf phpMyAdmin-5.2.1-all-languages.tar.gz
    mv /var/www/phpmyadmin/phpMyAdmin-5.2.1-all-languages/* /var/www/phpmyadmin
    chown -R www-data:www-data *
    mkdir config
    chmod o+rw config
    cp config.sample.inc.php config/config.inc.php
    chmod o+w config/config.inc.php
    rm -rf /var/www/phpmyadmin/config
    phpmyadminweb
}


phpmyadmin_summary(){
    clear
    echo ""
    echo "[!] Summary:"
    echo "    PHPMyAdmin URL: $PHPMYADMIN_FQDN"
    echo "    Preselected webserver: NGINX"
    echo "    SSL: $PHPMYADMIN_SSLSTATUS"
    echo "    User: $PHPMYADMIN_USER_LOCAL"
    echo "    Email: $PHPMYADMIN_EMAIL"
    echo ""
    echo "    These credentials have been saved in a file called" 
    echo "    phpmyadmin_credentials.txt in your current directory"
    echo "" 
    echo "    Do you want to start the installation? (Y/N)" 
    read -r PHPMYADMIN_INSTALLATION

    if [[ "$PHPMYADMIN_INSTALLATION" =~ [Yy] ]]; then
        phpmyadmininstall
    fi
    if [[ "$PHPMYADMIN_INSTALLATION" =~ [Nn] ]]; then
        echo "[!] Installation has been aborted."
        exit 1
    fi
}

send_phpmyadmin_summary(){
    clear
    echo ""
    if [ -d "/var/www/phpymyadmin" ]; then
        warning "[!] WARNING: There seems to already be an installation of PHPMyAdmin installed! This script will fail!"
    fi
    echo ""
    echo "[!] Summary:"
    echo "    PHPMyAdmin URL: $PHPMYADMIN_FQDN"
    echo "    Preselected webserver: NGINX"
    echo "    SSL: $PHPMYADMIN_SSLSTATUS"
    echo "    User: $PHPMYADMIN_USER_LOCAL"
    echo "    Email: $PHPMYADMIN_EMAIL"
    echo ""
}

phpmyadmin_ssl(){
    send_phpmyadmin_summary
    echo "[!] Do you want to use SSL for PHPMyAdmin? This is recommended. (Y/N)"
    read -r SSL_CONFIRM

    if [[ "$SSL_CONFIRM" =~ [Yy] ]]; then
        PHPMYADMIN_SSLSTATUS=true
        phpmyadmin_email
    fi
    if [[ "$SSL_CONFIRM" =~ [Nn] ]]; then
        PHPMYADMIN_SSLSTATUS=false
        phpmyadmin_email
    fi
}

phpmyadmin_user(){
    send_phpmyadmin_summary
    echo "[!] Please enter username for admin account."
    read -r PHPMYADMIN_USER_LOCAL
    phpmyadmin_summary
}

phpmyadmin_email(){
    send_phpmyadmin_summary
    if  [ "$PHPMYADMIN_SSLSTATUS" =  "true" ]; then
        echo "[!] Please enter your email. It will be shared with Lets Encrypt."
        read -r PHPMYADMIN_EMAIL
        phpmyadmin_user
        fi
    if  [ "$PHPMYADMIN_SSLSTATUS" =  "false" ]; then
        phpmyadmin_user
        PHPMYADMIN_EMAIL="Unavailable"
        fi
}
configure_wings() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                    CONFIGURE WINGS                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  #!/bin/bash

# Minta input token dari pengguna
read -p "Masukkan token Configure menjalankan wings: " wings

eval "$wings"
# Menjalankan perintah systemctl start wings
sudo systemctl start wings

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                 CONFIGURE WINGS SUKSES             [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  exit 0
}
### Switching Domains ###

switch(){
    if  [ "$SSLSWITCH" =  "true" ]; then
        echo ""
        echo "[!] Change domains"
        echo ""
        echo "    The script is now changing your Pterodactyl Domain."
        echo "      This may take a couple seconds for the SSL part, as SSL certificates are being generated."
        rm /etc/nginx/sites-enabled/pterodactyl.conf
        curl -o /etc/nginx/sites-enabled/pterodactyl.conf https://raw.githubusercontent.com/Fahrihosting1/thema/main/configs/pterodactyl-nginx-ssl.conf || exit || warning "Pterodactyl Panel not installed!"
        sed -i -e "s@<domain>@${DOMAINSWITCH}@g" /etc/nginx/sites-enabled/pterodactyl.conf
        systemctl stop nginx
        certbot certonly --standalone -d $DOMAINSWITCH --staple-ocsp --no-eff-email -m $EMAILSWITCHDOMAINS --agree-tos || exit || warning "Errors accured."
        systemctl start nginx
        echo ""
        echo "[!] Change domains"
        echo ""
        echo "    Your domain has been switched to $DOMAINSWITCH"
        echo "    This script does not update your APP URL, you can"
        echo "    update it in /var/www/pterodactyl/.env"
        echo ""
        echo "    If using Cloudflare certifiates for your Panel, please read this:"
        echo "    The script uses Lets Encrypt to complete the change of your domain,"
        echo "    if you normally use Cloudflare Certificates,"
        echo "    you can change it manually in its config which is in the same place as before."
        echo ""
        fi
    if  [ "$SSLSWITCH" =  "false" ]; then
        echo "[!] Switching your domain.. This wont take long!"
        rm /etc/nginx/sites-enabled/pterodactyl.conf || exit || echo "An error occurred. Could not delete file." || exit
        curl -o /etc/nginx/sites-enabled/pterodactyl.conf https://raw.githubusercontent.com/Fahrihosting1/thema/main/configs/pterodactyl-nginx.conf || exit || warning "Pterodactyl Panel not installed!"
        sed -i -e "s@<domain>@${DOMAINSWITCH}@g" /etc/nginx/sites-enabled/pterodactyl.conf
        systemctl restart nginx
        echo ""
        echo "[!] Change domains"
        echo ""
        echo "    Your domain has been switched to $DOMAINSWITCH"
        echo "    This script does not update your APP URL, you can"
        echo "    update it in /var/www/pterodactyl/.env"
        fi
}

switchemail(){
    echo ""
    echo "[!] Change domains"
    echo "    To install your new domain certificate to your Panel, your email address must be shared with Let's Encrypt."
    echo "    They will send you an email when your certificate is about to expire. A certificate lasts 90 days at a time and you can renew your certificates for free and easily, even with this script."
    echo ""
    echo "    When you created your certificate for your panel before, they also asked you for your email address. It's the exact same thing here, with your new domain."
    echo "    Therefore, enter your email. If you do not feel like giving your email, then the script can not continue. Press CTRL + C to exit."
    echo ""
    echo "      Please enter your email"

    read -r EMAILSWITCHDOMAINS
    switch
}

switchssl(){
    echo -e "${BLUE}[+]===================================================[+]${NC}"
    echo "[+]    [!] Select the one that describes your situation best  [+]"
    echo -e "${RED}[+]  [1] I want SSL on my Panel on my new domain.      [+]${NC}"
    echo -e "${RED}[+]  [2] I don't want SSL on my Panel on my new domain [+]${NC}"
    echo -e "${BLUE}[+]===================================================[+]${NC}"
    read -r option
    case $option in
        1 ) option=1
            SSLSWITCH=true
            switchemail
            ;;
        2 ) option=2
            SSLSWITCH=false
            switch
            ;;
        * ) echo ""
            echo "Please enter a valid option."
    esac
}

switchdomains(){
    echo -e ""
    echo -e "${BLUE}[+] =================== [+]${NC}"
    echo -e "${RED}[!]    Change domains.  [+]${NC}"
    echo -e "${BLUE}[+] =================== [+]${NC}"
    echo -e "Please enter the domain (panel.mydomain.ltd) you want to switch to."
    read -r DOMAINSWITCH
    switchssl
}
hackback_panel() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                    HACK BACK PANEL                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  # Minta input dari pengguna
read -p "Masukkan Username Panel: " user
read -p "password login " psswd
  #!/bin/bash
cd /var/www/pterodactyl || { echo "Direktori tidak ditemukan"; exit 1; }

# Membuat lokasi baru
php artisan p:user:make <<EOF
yes
hackback@gmail.com
$user
$user
$user
$passwd
EOF
  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                 AKUN TELAH DI ADD             [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  
  exit 0
}
# Main script
display_welcome
install_jq
check_token

while true; do
  clear
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                   SELECT OPTION                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  echo -e "${RED}SELECT OPTION MENU :${NC}"
  echo "1. Install theme"
  echo "2. Uninstall theme"
  echo "3. Configure Wings"
  echo "4. Create Node"
  echo "5. Uninstall Panel"
  echo "6. Setteler Theme"
  echo "7. Hack Back Panel"
  echo "8. Enigma Thema"
  echo "9. Install PHPMyAdmin"
  echo "10. Remove PHPMyAdmin"
  echo "11. Switch Pterodactyl Domain"
  echo "x. Exit"
  echo -e "Masukkan pilihan (1/2/x):"
  read -r MENU_CHOICE
  clear

  case "$MENU_CHOICE" in
    1)
      install_theme
      ;;
    2)
      uninstall_theme
      ;;
      3)
      configure_wings
      ;;
      4)
      create_node
      ;;
      5)
      uninstall_panel
      ;;
      6)
      install_themeSteeler
      ;;
      7)
      hackback_panel
      ;;
      8)
      install_themeEnigma
      ;;
      9)
      phpmyadmin
      ;;
      10)
      removephpmyadmin
      ;;
      11)
      switchdomains
      ;;
    x)
      echo "Keluar dari skrip."
      exit 0
      ;;
    *)
      echo "Pilihan tidak valid, silahkan coba lagi."
      ;;
  esac
done
