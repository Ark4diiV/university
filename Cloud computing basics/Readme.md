# Cloud computing basics
MongoDB and JS practice
## Installation
1. Download MongoDB packages
```
wget https://repo.mongodb.org/apt/ubuntu/dists/focal/mongodb-org/5.0/multiverse/binary-arm64/mongodb-org-mongos_5.0.5_arm64.deb
wget https://repo.mongodb.org/apt/ubuntu/dists/focal/mongodb-org/5.0/multiverse/binary-arm64/mongodb-org-shell_5.0.5_arm64.deb
```
2. Install deb packages
```
sudo dpkg -i *.deb
```
3. Start and enable mongodb services
```
sudo systemctl start mongod.service
sudo systemctl status mongod.service
sudo systemctl enable mongod.service
```
4. Install npm
```
sudo apt install npm
```
5. Chose dir with js scripts and execute
```
npm i mongodb
```
6. Open your encoding.js folder in node_modules>whatwg-url>dist and write this code
```
"use strict";
var util= require('util');
const utf8Encoder = new util.TextEncoder();
const utf8Decoder = new util.TextDecoder("utf-8", { ignoreBOM: true });
```
in place of
```"use strict";
const utf8Encoder = new TextEncoder();
const utf8Decoder = new TextDecoder("utf-8", { ignoreBOM: true });
```
## MongoDB commands
### listDatabases
```
db.adminCommand( { listDatabases: 1 } )
```
### dropDatabase
```
use studentsdb
db.dropDatabase()
```
## Tasks
Подготовить базу данных в MongoDB и JS-скрипт(-ы), реализующие следующие запросы:
1. Наполнение БД информацией о 10 студентах: имя, фамилия, возраст, группа, оценки по нескольким дисциплинам (перечень дисциплин у каждого студента может отличаться)
2. Получить список студентов со средними оценками по каждой дисциплине
3. Получить список студентов со средней оценкой
4. Получить список студентов со средней оценкой выше 4.75
5. Вывести списки студентов, разбитые по по группам