var mysql      = require('mysql');
var mysql_cred = require('../config.production.json');
delete mysql_cred.database.connection.database
    
var con = mysql.createConnection(mysql_cred.database.connection);
con.connect();
con.query('SHOW VARIABLES WHERE Variable_Name = "basedir"', function (error, results, fields) {
    if (error) throw error;
        console.log(results[0].Value + '\\bin\\mysql');
    });
con.end();