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
### Aggregations
```
dbo.studentsdb.aggregate([{
        $addFields: { 'scores': { '$objectToArray': '$scores' } } //Подменяем поле scores в документе. Конвертируем ключ:значения из scores в массивы
    },
    { $unwind: { path: '$scores' } }, //Оставляем в документе только 1 предмет из scores
    { $group: { _id: '$fullName', AvgScore: { $push: { $avg: '$scores.v' } } } }, //Группируем по ФИ. Для ключа AvgScore в значение пишем массив из avg scores.k
    {
        $project: { _id: 1, AvgScore: { $avg: '$AvgScore' } } //Возвращаем ФИ и среднюю оценку
    }
])
```
```
dbo.studentsdb.aggregate([{ $addFields: { 'scores': { '$objectToArray': '$scores' } } }, //Подменяем поле scores в документе. Конвертируем ключ:значения из scores в массивы
    { $unwind: { path: '$scores', } }, //Оставляем в документе только 1 предмет из scores
    {
       $group: {
            _id: '$fullName', //Группировка по имени студента
            AvgScore: {
                $push: //Для ключа AvgScore в значение пишем массив из scores.k + avg scores.k
                { $concat: ['$scores.k', '=', { "$substr": [{ $avg: '$scores.v' }, 0, 4] }] } //Вернем avg value строки с оценками, длинной 0-4. Соединяем key строки с avg оценками
            }
        }
    }
])
```
```
dbo.studentsdb.aggregate([{
        $addFields: { 'scores': { '$objectToArray': '$scores' } }
    },
    { $unwind: { path: '$scores' } },
    { $group: { _id: '$fullName', AvgScore: { $push: { $avg: '$scores.v' } } } },
    { $project: { _id: 1, AvgScore: { $avg: '$AvgScore' } } },
    { $project: { _id: 1, AvgScore: 1, condition: { $gt: ['$AvgScore', 4.75] } } }, //Condition содержит AvgScore больше 4.75. Выбрать такие документы
    { $match: { condition: true } }, //Фильтр документов по условию
    {
        $project: { _id: 1, AvgScore: 1 } //Вывести ФИ и AvgScore
    }
])
```
```
dbo.studentsdb.aggregate([
        { "$group": { _id: "$group", Group: { "$push": "$fullName" } } } //Вставить ФИ в Group и группу в документ. Группировать по полю group
    ])
```