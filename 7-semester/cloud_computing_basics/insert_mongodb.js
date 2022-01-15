var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/";

MongoClient.connect(url, function(err, db) {
    if (err) throw err;
    var dbo = db.db("studentsdb");
    var students = [{
            fullName: 'Иван Иванов',
            marks: {
                'Математика': [5, 4, 5, 5],
                'Физика': [3, 4]
            },

        }, {
            fullName: 'Петр Петров',
            marks: {
                'Физика': [5, 4, 5],
                'Биология': [3]
            },
        }, {
            fullName: 'Петр Петров',
            marks: {
                'Русский язык': [2, 2, 3, 3],
                'Физика': [5, 4, 5],
                'Биология': [3]
            },
        }, {
            fullName: 'Петр Петров',
            marks: {
                'Русский язык': [2, 2, 3, 3],
                'Физика': [5, 4, 5],
                'Биология': [3]
            },
        }, {
            fullName: 'Петр Петров',
            marks: {
                'Русский язык': [2, 2, 3, 3],
                'Физика': [5, 4, 5],
                'Биология': [3]
            },
        }, {
            fullName: 'Петр Петров',
            marks: {
                'Русский язык': [2, 2, 3, 3],
                'Физика': [5, 4, 5],
                'Биология': [3]
            },
        }, {
            fullName: 'Петр Петров',
            'Русский язык': [2, 2, 3, 3],
            marks: {
                'Русский язык': [2, 2, 3, 3],
                'Физика': [5, 4, 5],
                'Биология': [3]
            },
        }, {
            fullName: 'Петр Петров',
            marks: {
                'Русский язык': [2, 2, 3, 3],
                'Физика': [5, 4, 5],
                'Биология': [3]
            },
        }, {
            fullName: 'Петр Петров',
            marks: {
                'Русский язык': [2, 2, 3, 3],
                'Физика': [5, 4, 5],
                'Биология': [3]
            },
        }, {
            fullName: 'Петр Петров',
            marks: {
                'Русский язык': [2, 2, 3, 3],
                'Физика': [5, 4, 5],
                'Биология': [3]
            },
        }

    ];
    dbo.collection("customers").insertMany(students, function(err, res) {
        if (err) throw err;
        console.log("Number of documents inserted: " + res.insertedCount);
        db.close();
    });
});