# Installation for Ubuntu 20.04.3 LTS 5.11.0-46-generic aarch64
## Download MongoDB packages
`wget https://repo.mongodb.org/apt/ubuntu/dists/focal/mongodb-org/5.0/multiverse/binary-arm64/mongodb-org-mongos_5.0.5_arm64.deb`
`wget https://repo.mongodb.org/apt/ubuntu/dists/focal/mongodb-org/5.0/multiverse/binary-arm64/mongodb-org-shell_5.0.5_arm64.deb`
## Indtall deb packages
`sudo dpkg -i *.deb`
## Start and enable mongodb services
```
sudo systemctl start mongod.service
sudo systemctl status mongod.service
sudo systemctl enable mongod.service
```
## Install npm
`sudo apt install npm`
## Chose dir with js scripts and execute
`npm i mongodb`