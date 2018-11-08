install_miner() {
GITHUB_REPO=$1
BIN_KEY=$2
SM_MINER=$3
GITHUB_BIN_URL="$(curl -sSL https://api.github.com/repos/${GITHUB_REPO}/releases/latest | jq -r ".assets[] | select(.name | test(\"${BIN_KEY}\")) | .browser_download_url")"
    mkdir /root/miner_org/${SM_MINER}
    curl -sSL "$GITHUB_BIN_URL" | tar xvz --strip-components=1 -C /root/miner_org/${SM_MINER}/
}
install_miner "ubiq/ubqminer" "9.1-linux" "ethminer-v0.11.0"
cd /root/miner_org/${SM_MINER}
ln -s --force ubqminer ethminer
cd
chown -R miner:miner /root/miner_org/${SM_MINER}
whiptail --msgbox "Go to http://simplemining.net and setup a new rig group for ethminer-v0.11.0 that is now actually Ubqminer.  If you have 1080/1080ti You are going to want to enable Ethlargement for this one." --backtitle "Ubqminer" --title "Ubqminer" 15 55
