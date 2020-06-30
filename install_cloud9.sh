cd /opt/
git clone https://github.com/c9/core.git c9sdk

#install requirements
sudo apt install nodejs
cd c9sdk
./scripts/install-sdk.sh

#install service
sudo cp cloud9.service /etc/systemd/system/cloud9.service
sudo systemctl daemon-reload
sudo systemctl cloud9 enable
sudo systemctl cloud9 start


