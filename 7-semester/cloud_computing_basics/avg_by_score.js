var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://127.0.0.1:27017/";

MongoClient.connect(url, function(err, db) {
    if (err) throw err;
    var dbo = db.db("studentsdb");
    dbo.collection('studentsdb').aggregate([{ $addFields: { 'scores': { '$objectToArray': '$scores' } } },
        //Подменяем поле scores в документе. Конвертируем ключ:значения из scores в массивы.
        { $unwind: { path: '$scores', } }, //Оставляем в документе только 1 предмет из scores
        {
            $group: {
                _id: '$fullName', //Группировка по имени студента
                AvgScore: {
                    $push: //Для ключа AvgScore в значение пишема массив из scores.k + avg scores.k
                    { $concat: ['$scores.k', '=', { "$substr": [{ $avg: '$scores.v' }, 0, 4] }] }
                }
            }
        } //Вернем avg value строки с оценками, длинной 0-4. Соединяем key строки с avg оценками
    ]).toArray(function(err, result) {
        if (err) throw err;
        console.log(result);
        db.close();
    });
});