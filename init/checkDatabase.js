var mysql      = require('mysql');
var mysql_cred = require('../config.production.json');
var con = mysql.createConnection(mysql_cred.database.connection);

var skip = con.connect(function(err){
    if(!err) {
        console.log("true");
    }
    else {
        console.log("false");
    }
});
con.end();