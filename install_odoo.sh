yum update -y
sudo yum -y install epel-release 

#install nocejs and node-less dependencies for ODOO
sudo yum install nodejs -y
sudo npm install node-less -y

#install even more dependencies
sudo yum -y install git gcc wget libxslt-devel bzip2-devel openldap-devel libjpeg-devel freetype-devel

#download compile and install Python 3
VER=3.6.10
sudo yum install -y openssl-devel bzip2-devel libffi-devel make nano
wget https://www.python.org/ftp/python/$VER/Python-$VER.tgz
tar xvf Python-$VER.tgz
cd Python-$VER
./configure --enable-optimizations --with-ensurepip=install
sudo make 
sudo make install
cd ../

#install pip items
pip3 install --upgrade pip setuptools
pip3 install wheel

#INSTALL ODOO

#setup system user for the odoo service to run as
sudo useradd -m -U -r -d /opt/odoo -s /bin/bash odoo

#download and install PostgreSQL

#add the postgres repo to dnf
sudo yum -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm

#install postgres server
yum install -y postgresql12-server
/usr/pgsql-12/bin/postgresql-12-setup initdb


#enable the service at boot
sudo systemctl enable postgresql-12
sudo systemctl start postgresql-12

#assign the system user to the db engine.
sudo su - postgres -c "createuser -s odoo"

#install wkhtmltopdf (for reports html to pdf converter)
wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.1/wkhtmltox-0.12.1_linux-centos7-amd64.rpm
sudo yum -y localinstall wkhtmltox-0.12.1_linux-centos7-amd64.rpm

#download the odoo source and install requirements
git clone https://www.github.com/odoo/odoo --depth 1 --branch 12.0 /opt/odoo/12.0
pip3 install -r /opt/odoo/12.0/requirements.txt

mkdir /var/log/odoo
mkdir /opt/odoo/cache
mkdir /opt/odoo/extra_addons
mkdir /opt/odoo/extra_addons/12.0

git clone https://github.com/OCA/account-financial-tools.git --branch=12.0 --depth=1 /opt/odoo/extra_addons/oca_account-financial-tools
git clone https://github.com/OCA/knowledge.git --branch=12.0 --depth=1 /opt/odoo/extra_addons/oca_knowledge
git clone https://github.com/OCA/management-system.git --branch=12.0 --depth=1 /opt/odoo/extra_addons/oca_management
git clone https://github.com/OCA/manufacture.git --branch=12.0 --depth=1 /opt/odoo/extra_addons/oca_manufacture

cp odoo.conf /etc/odoo.conf
cp odoo.service /etc/systemd/system/odoo.service

chown odoo:odoo /opt/odoo -R
chown odoo:odoo /var/log/odoo -R
chown odoo:odoo /etc/odoo.conf
chown odoo:odoo /etc/systemd/system/odoo.service

systemctl daemon-reload
systemctl enable odoo
systemctl start odoo

#install cloud9 IDE

yum install -y glibc-static
git clone https://github.com/c9/core.git /opt/c9sdk
bash /opt/c9sdk/scripts/install-sdk.sh

cp cloud9.service /etc/systemd/system/cloud9.service
systemctl daemon-reload
systemctl enable cloud9
systemctl start cloud9

