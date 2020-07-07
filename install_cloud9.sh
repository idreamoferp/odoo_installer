#install service
sudo cp cloud9.service /etc/systemd/system/cloud9.service

cd /opt/
git clone https://github.com/c9/core.git c9sdk

#install requirements
sudo apt update
sudo apt upgrade -y
sudo apt install nodejs -y

#install c9sdk
cd c9sdk
./scripts/install-sdk.sh

#add python debugger
pip3 install ikp3db

#setup service
sudo systemctl daemon-reload
sudo systemctl enable cloud9.service
sudo systemctl start cloud9.service
