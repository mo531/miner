install_miner() {
GITHUB_BIN_URL="$(curl -sSL https://api.github.com/repos/$1/releases/tags/$4 | jq -r ".assets[] | select(.name | test(\"$2\")) | .browser_download_url")"
	rm -rf /root/miner_org/$3
    mkdir /root/miner_org/$3
    curl -sSL "$GITHUB_BIN_URL" | tar xvz --strip-components=1 -C /root/miner_org/$3/
}
install_miner "EggPool/EggMinerGpu" "Lin" "ccminer-tpruvot-v2.1" "4.0.100"
cd /root/miner_org/ccminer-tpruvot-v2.1
ln -s --force eggminer ccminer
chown -R miner:miner /root/miner_org/ccminer-tpruvot-v2.1
cd
whiptail --msgbox "Go to http://simplemining.net and setup a new rig group for ccminer-tpruvot-v2.1 that is now actually EggMinerV4." --backtitle "EggMinerV4" --title "EggMinerV4" 15 55
