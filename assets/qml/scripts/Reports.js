.import QtQuick.LocalStorage 2.0 as Sql

var db = Sql.LocalStorage.openDatabaseSync("ReCrayonApp", "1.0", "This database contains the reports.", 100000)

function init() {
    db.transaction(
        function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS Reports(school TEXT, teacher TEXT, date INTEGER, boxes INTEGER)')
        }
    )
}

function addReport(report) {
    db.transaction(
        function(tx) {
            tx.executeSql('INSERT INTO Reports VALUES(?, ?, ?, ?)', [ report.school, report.teacher, report.date, report.boxes ])
        }
    )
}

function reports(from, to) {
    var arrayOfReports = []

    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM Reports WHERE date >= ? AND date <= ? ORDER BY date ASC', [from, to])

            for (var i = 0; i < rs.rows.length; i++) {
                var report = {
                    "school" : rs.rows.item(i).school,
                    "teacher" : rs.rows.item(i).teacher,
                    "date" : rs.rows.item(i).date,
                    "boxes" : rs.rows.item(i).boxes
                }

                arrayOfReports.push(report)
            }
        }
    )

    return arrayOfReports
}
