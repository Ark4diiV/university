var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://127.0.0.1:27017/";

MongoClient.connect(url, function(err, db) {
    if (err) throw err;
    var dbo = db.db("studentsdb");
    dbo.collection('studentsdb').aggregate([
        { "$group": { _id: "$group", Group: { "$push": "$fullName" } } }
        //Вставить ФИ в Group и группу в документ. Группировать по полю group
    ]).toArray(function(err, result) {
        if (err) throw err;
        console.log(result);
        db.close();
    });
});