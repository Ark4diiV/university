var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://127.0.0.1:27017/";

MongoClient.connect(url, function(err, db) {
    if (err) throw err;
    var dbo = db.db("studentsdb");
    dbo.collection('studentsdb').aggregate([{
            $addFields: { 'scores': { '$objectToArray': '$scores' } }
        },
        { $unwind: { path: '$scores' } },
        { $group: { _id: '$fullName', AvgScore: { $push: { $avg: '$scores.v' } } } },
        { $project: { _id: 1, AvgScore: { $avg: '$AvgScore' } } },
        { $project: { _id: 1, AvgScore: 1, condition: { $gt: ['$AvgScore', 4.75] } } },
        //Condition содержит AvgScore больше 4.75. Выбрать такие документы
        { $match: { condition: true } }, //Фильтр документов по условию
        {
            $project: { _id: 1, AvgScore: 1 } //Вывести ФИ и AvgScore
        }
    ]).toArray(function(err, result) {
        if (err) throw err;
        console.log(result);
        db.close();
    });
});