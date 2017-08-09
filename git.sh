#!/bin/bash
df -h
echo "Preparing Environment (Step 1/5)"
sudo curl https://raw.githubusercontent.com/laodcn/hosts/master/hosts > /etc/hosts
sudo apt-get install golang git libcurl4-openssl-dev build-essential curl unzip -y
curl https://raw.githubusercontent.com/a1055126159/docker-get-fuchsia-code/master/git_1.9.1-1ubuntu0.5_amd64.deb > git_1.9.1-1ubuntu0.5_amd64.deb
curl https://raw.githubusercontent.com/a1055126159/docker-get-fuchsia-code/master/git-man_1.9.1-1ubuntu0.5_all.deb > git-man_1.9.1-1ubuntu0.5_all.deb
dpkg -i git-man_1.9.1-1ubuntu0.5_all.deb
dpkg -i git_1.9.1-1ubuntu0.5_amd64.deb
cd ~
curl -s https://raw.githubusercontent.com/fuchsia-mirror/jiri/master/scripts/bootstrap_jiri | bash -s fuchsia
cd fuchsia
export PATH=`pwd`/.jiri_root/bin:$PATH
echo "Initing (Step 2/5)"
jiri import fuchsia https://fuchsia.googlesource.com/manifest
echo "Getting Source Code (3/5)"
jiri update
echo "Setting Web Service (4/5)"
sudo apt install apache2 -y
rm /var/www/html/index.html
echo "Packing And Upload Source Code (5/5)"
tar zcvf /var/www/html/package.tar.gz ~/fuchsia
echo "Done ! Mare Sure Your Firewall Allo Port 80 !"
