var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/";

MongoClient.connect(url, function(err, db) {
    if (err) throw err;
    var dbo = db.db("studentsdb");
    var students = [{
            fullName: 'Кадушина Виктория',
            age: 20,
            group: 'б1-ДИЗН-31',
            scores: {
                'Информатика': [5, 5, 5, 5],
                'Физика': [5, 4, 5, 5],
                'Математика': [5, 5, 5, 5]
            },
        }, {
            fullName: 'Кадыкова Юлия',
            age: 20,
            group: 'б1-ИВЧТ-31',
            scores: {
                'Информатика': [5, 4, 5],
                'Физика': [5, 4, 5, 5],
                'Математика': [5, 4, 5, 5]
            },
        }, {
            fullName: 'Раткин Василий',
            age: 19,
            group: 'б1-ИФСТ-31',
            scores: {
                'Информатика': [5, 4, 5, 5],
                'Философия': [5, 4, 5, 5],
                'Философия': [5, 4, 5, 5]
            },
        }, {
            fullName: 'Родионов Игорь',
            age: 20,
            group: 'б-ПИНЖ-31',
            scores: {
                'Информатика': [2, 3, 3, 3],
                'Философия': [5, 4, 5, 5],
                'Математика': [3, 4, 5, 5]
            },
        }, {
            fullName: 'Табоякова Юлия',
            age: 20,
            group: 'б2-ИФСТ-31',
            scores: {
                'Информатика': [5, 4, 5, 5],
                'Физика': [5, 4, 5, 5],
                'Математика': [5, 4, 5, 5]
            },
        }, {
            fullName: 'Жданов Сергей',
            age: 20,
            group: 'б-ТЛВД-31',
            scores: {
                'Русский язык': [5, 5, 5, 3],
                'Физика': [5, 5, 5, 5],
                'Философия': [5, 5, 5, 5]
            },
        }, {
            fullName: 'Глазков Виктор',
            age: 20,
            group: 'б1-ПИНФ-31',
            scores: {
                'Информатика': [2, 3, 3, 3],
                'Физика': [5, 4, 5, 5],
                'Математика': [5, 4, 3, 5]
            },
        }, {
            fullName: 'Головенкова Екатерина',
            age: 20,
            group: 'б2-ИФСТ-32',
            scores: {
                'Информатика': [2, 2, 3, 3],
                'Физика': [5, 3, 5, 5],
                'Математика': [5, 4, 5, 5]
            },
        }, {
            fullName: 'Овчинников Игорь',
            age: 19,
            group: 'б-ТЛВД-31',
            scores: {
                'Информатика': [5, 5, 5, 5],
                'Физика': [5, 5, 5, 5],
                'Философия': [5, 5, 5, 5]
            },
        }, {
            fullName: 'Осипов Олег',
            age: 20,
            group: 'б-ТЛВД-31',
            scores: {
                'Информатика': [2, 3, 3, 3],
                'Физика': [5, 4, 5, 5],
                'Философия': [5, 4, 5, 5]
            },
        }

    ];
    dbo.collection("studentsdb").insertMany(students, function(err, res) {
        if (err) throw err;
        console.log("Number of documents inserted: " + res.insertedCount);
        db.close();
    });
});