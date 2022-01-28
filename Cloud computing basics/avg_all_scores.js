var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://127.0.0.1:27017/";

MongoClient.connect(url, function(err, db) {
    if (err) throw err;
    var dbo = db.db("studentsdb");
    dbo.collection('studentsdb').aggregate([{
            $addFields: { 'scores': { '$objectToArray': '$scores' } }
            //Подменяем поле scores в документе. Конвертируем ключ:значения из scores в массивы
        },
        { $unwind: { path: '$scores' } }, //Оставляем в документе только 1 предмет из scores
        { $group: { _id: '$fullName', AvgScore: { $push: { $avg: '$scores.v' } } } },
        //Группируем по ФИ. Для ключа AvgScore в значение пишем массив из avg scores.k
        {
            $project: { _id: 1, AvgScore: { $avg: '$AvgScore' } }
            //Возвращаем ФИ и среднюю оценку
        }
    ]).toArray(function(err, result) {
        if (err) throw err;
        console.log(result);
        db.close();
    });
});