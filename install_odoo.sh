yum update -y
sudo yum install epel-release 

#install nocejs and node-less dependencies for ODOO
sudo yum install nodejs -y
sudo npm install node-less -y

#install even more dependencies
sudo yum install git gcc wget libxslt-devel bzip2-devel openldap-devel libjpeg-devel freetype-devel

#download compile and install Python 3
VER=3.6.10
sudo yum install -y openssl-devel bzip2-devel libffi-devel make
#wget https://www.python.org/ftp/python/$VER/Python-$VER.tgz
#tar xvf Python-$VER.tgz
#cd Python-$VER
#./configure --enable-optimizations --with-ensurepip=install
#sudo make 
#sudo make install
#cd ../

#install pip items
pip3 install --upgrade pip setuptools
pip3 install wheel

#INSTALL ODOO

#setup system user for the odoo service to run as
sudo useradd -m -U -r -d /opt/odoo -s /bin/bash odoo

#download and install PostgreSQL

#add the postgres repo to dnf
dnf -y module enable postgresql:12

#install postgres server
dnf -y install postgresql-server
sudo postgresql-setup --initdb

#enable the service at boot
sudo systemctl enable postgresql
sudo systemctl start postgresql

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

cp odoo.conf /etc/odoo.conf
cp odoo.service /etc/systemd/system/odoo.service

chown odoo:odoo /opt/odoo -R
chown odoo:odoo /var/log/odoo -R
chown odoo:odoo /etc/odoo.conf
chown odoo:odoo /etc/systemd/system/odoo.service

systemctl daemon-reload
systemctl enable odoo
systemctl start odoo

