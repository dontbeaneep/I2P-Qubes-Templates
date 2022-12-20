#! /bin/bash
###CUSTOMIZE TO YOUR NEEDS### 
##ALSO DECIDE IF YOU NEED TO INSTALL BOTH I2P AND LIBREWOLF IN YOUR TEMPLATE

#######################################################################################################################
##WHONIX##
#scurl --proxy http://127.0.0.1:8082 --tlsv1.2 https://geti2p.net/_static/i2p-archive-keyring.gpg | gpg --dearmor | tee /usr/share/keyrings/i2p-archive-keyring.gpg > /dev/null;
#scurl --proxy http://127.0.0.1:8082 --tlsv1.2 https://deb.librewolf.net/keyring.gpg | gpg --dearmor | tee /usr/share/keyrings/librewolf.gpg > /dev/null; 
#echo "deb [signed-by=/usr/share/keyrings/i2p-archive-keyring.gpg] tor+https://deb.i2p2.de/ bullseye main" | tee /etc/apt/sources.list.d/i2p.list > /dev/null; 
#echo "deb [arch=amd64 signed-by=/usr/share/keyrings/librewolf.gpg] tor+http://deb.librewolf.net bullseye main" | tee /etc/apt/sources.list.d/librewolf.list > /dev/null;
#apt-get update; 
#apt-get install i2p i2p-keyring librewolf -y; 
#dpkg-reconfigure i2p &&
#systemctl enable i2p;
###COMMENT OUT THIS LONG ECHO COMMAND IF YOU DO NOT WANT TO PRECONFIGURE YOUR ROUTER-CONSOLE##
#echo -e "#! /bin/bash \necho -e \"i2np.inboundBurstKBytes.bandwidth=178379 \ni2np.bandwidth.inboundBurstKBytesPerSecond=8919 \ni2np.bandwidth.inboundKBytesPerSecond=8869 \ni2np.bandwidth.outboundBurstKBytes=23301 \ni2np.bandwidth.outboundBurstKBytesPerSecond=1165 \ni2np.bandwidth.outboundKBytesPerSecond=1115 \ni2np.lastCountry=us \ni2np.udp.internalPort=18729 \ni2np.udp.port=18729 \njbigi.lastProcessor=Kaby Lake Core i3/i5/i7/64 \nrouter.firstVersion=1.9.0 \nrouter.passwordManager.migrated=true \nrouter.previousVersion=2.0.0 \nrouter.sharePercentage=80 \nrouter.startup.jetty9.migrated=true \nrouter.updateDisabled=true \nrouterconsole.country= \nrouterconsole.lang=en \nrouterconsole.newsLastNewEntry=0 \nrouterconsole.newsLastUpdated=0 \nrouterconsole.theme=dark \nrouterconsole.welcomeWizardComplete=true\" | tee router.txt > /dev/null;" | tee /router.sh > /dev/null; chmod +x /router.sh; mv /usr/share/librewolf/librewolf.cfg /usr/share/librewolf/backupconfig.cfg && mv /home/user/librewolf.cfg /usr/share/librewolf/librewolf.cfg;
#systemctl restart i2p
#apt update && apt upgrade -y;
#poweroff
######################################################################################################################
##DEBIAN/UBUNTU##
curl --proxy http://127.0.0.1:8082 --tlsv1.2 https://geti2p.net/_static/i2p-archive-keyring.gpg | gpg --dearmor | tee /usr/share/keyrings/i2p-archive-keyring.gpg > /dev/null; 
curl --proxy http://127.0.0.1:8082 --tlsv1.2 https://deb.librewolf.net/keyring.gpg | gpg --dearmor | tee /usr/share/keyrings/librewolf.gpg > /dev/null; 
echo "deb [signed-by=/usr/share/keyrings/i2p-archive-keyring.gpg] https://deb.i2p2.de/ bullseye main" | tee /etc/apt/sources.list.d/i2p.list > /dev/null; 
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/librewolf.gpg] http://deb.librewolf.net bullseye main" | tee /etc/apt/sources.list.d/librewolf.list > /dev/null;
apt-get update; 
apt-get install i2p i2p-keyring librewolf -y; 
dpkg-reconfigure i2p && 
systemctl enable i2p; 
##COMMENT OUT THIS LONG ECHO COMMAND IF YOU DO NOT WANT TO PRECONFIGURE YOUR ROUTER-CONSOLE##
echo -e "i2np.inboundBurstKBytes.bandwidth=178379 \ni2np.bandwidth.inboundBurstKBytesPerSecond=8919 \ni2np.bandwidth.inboundKBytesPerSecond=8869 \ni2np.bandwidth.outboundBurstKBytes=23301 \ni2np.bandwidth.outboundBurstKBytesPerSecond=1165 \ni2np.bandwidth.outboundKBytesPerSecond=1115 \ni2np.lastCountry=us \ni2np.udp.internalPort=18729 \ni2np.udp.port=18729 \njbigi.lastProcessor=Kaby Lake Core i3/i5/i7/64 \nrouter.firstVersion=1.9.0 \nrouter.passwordManager.migrated=true \nrouter.previousVersion=2.0.0 \nrouter.sharePercentage=80 \nrouter.startup.jetty9.migrated=true \nrouter.updateDisabled=true \nrouterconsole.country= \nrouterconsole.lang=en \nrouterconsole.newsLastNewEntry=0 \nrouterconsole.newsLastUpdated=0 \nrouterconsole.theme=dark \nrouterconsole.welcomeWizardComplete=true" | tee router.txt > /dev/null; cat router.txt >> /var/lib/i2p/i2p-config/router.config; mv /usr/share/librewolf/librewolf.cfg /usr/share/librewolf/backupconfig.cfg && mv /home/user/librewolf.cfg /usr/share/librewolf/librewolf.cfg;
systemctl restart i2p;
apt update && apt upgrade -y;
poweroff
#########################################################################################################################
