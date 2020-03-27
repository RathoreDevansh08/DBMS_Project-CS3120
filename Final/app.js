var express = require("express");
var app     = express();
var mysql   = require("mysql");
var path    = require("path");
var bodyParser = require("body-parser");

var server = app.listen(4200, function(req,res) {
   console.log("Server is running");
});

app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());
app.use(require("express-session")({
    secret: "It's a secret code",
    resave: false,
    saveUninitialized: false
}));

var connection = mysql.createConnection({
	host     : 'localhost',
	user     : 'him',
	password : '',
	database : 'cdc'
});

app.get("/", function(req,res){
   res.render("login.ejs");
});

app.post("/auth", function(req,res){
	var username = req.body.username;
	var password = req.body.password;
	var usertype = req.body.usertype;
	if (usertype == 'student')
	{
		if(username && password){
			
			connection.query('select * from student where student_id=? and pass = ?', [username,password], function(err,results,fields){
				if (results.length > 0){
					req.session.loggedin = true;
					req.session.username = username;
					res.render("student/profile.ejs", {student: results});
				} else {
					res.send('Incorrect Username and/or Password');
				}
				res.end();
			});
		} else {
			res.send('Please enter username and password');
			res.end();
		}
	}
	else if (usertype == 'tpo')
	{
		if(username && password){
			
			connection.query('select * from tpo where tpo_id=? and pass = ?', [username,password], function(err,results,fields){
				if (results.length > 0){
					req.session.loggedin = true;
					req.session.username = username;
					res.render("tpo/tpo_profile.ejs");
				} else {
					res.send('Incorrect Username and/or Password');
				}
				res.end();
			});
		} else {
			res.send('Please enter username and password');
			res.end();
		}
	}
	else if (usertype == 'studentrep')
	{
		if(username && password){
			
			connection.query('select * from student_rep where student_rep_id=? and pass = ?', [username,password], function(err,results,fields){
				if (results.length > 0){
					req.session.loggedin = true;
					req.session.username = username;
					res.send('ohhooo its student_rep');
				} else {
					res.send('Incorrect Username and/or Password');
				}
				res.end();
			});
		} else {
			res.send('Please enter username and password');
			res.end();
		}
	}
	else if (usertype == 'staff')
	{
		if(username && password){
			
			connection.query('select * from staff_rep where staff_id=? and pass = ?', [username,password], function(err,results,fields){
				if (results.length > 0){
					req.session.loggedin = true;
					req.session.username = username;
					res.send('ohhooo its staff');
				} else {
					res.send('Incorrect Username and/or Password');
				}
				res.end();
			});
		} else {
			res.send('Please enter username and password');
			res.end();
		}
	}
	else if (usertype == 'company')
	{
		if(username && password){
			
			connection.query('select * from company where company_id=? and pass = ?', [username,password], function(err,results,fields){
				if (results.length > 0){
					req.session.loggedin = true;
					req.session.username = username;
					res.send('ohhooo its company');
				} else {
					res.send('Incorrect Username and/or Password');
				}
				res.end();
			});
		} else {
			res.send('Please enter username and password');
			res.end();
		}
	}
});

app.post("/tpoSearch", function(req,res){
	var username = req.body.ID;
	var type = req.body.usertype;
	if (type == 'student')
	{
		if(username){
			
			connection.query('select * from student where student_id=?', [username], function(err,results,fields){
				if (results.length > 0){
					req.session.loggedin = true;
					req.session.username = username;
					res.render("student/profile.ejs", {student: results});
				} else {
					res.send('Incorrect Username');
				}
				res.end();
			});
		} else {
			res.send('Please enter username');
			res.end();
		}
	}
	else if (type == 'studentrep')
	{
		if(username){
			
			connection.query('select * from student_rep where student_rep_id=?', [username], function(err,results,fields){
				if (results.length > 0){
					req.session.loggedin = true;
					req.session.username = username;
					res.send('ohhooo its student_rep');
				} else {
					res.send('Incorrect Username');
				}
				res.end();
			});
		} else {
			res.send('Please enter username');
			res.end();
		}
	}
	else if (type == 'staff')
	{
		if(username){
			
			connection.query('select * from staff_rep where staff_id=?', [username], function(err,results,fields){
				if (results.length > 0){
					req.session.loggedin = true;
					req.session.username = username;
					res.send('ohhooo its staff');
				} else {
					res.send('Incorrect Username');
				}
				res.end();
			});
		} else {
			res.send('Please enter username ');
			res.end();
		}
	}
	else if (type == 'company')
	{
		if(username){
			
			connection.query('select * from company where company_id=?', [username], function(err,results,fields){
				if (results.length > 0){
					req.session.loggedin = true;
					req.session.username = username;
					res.send('ohhooo its company');
				} else {
					res.send('Incorrect Username');
				}
				res.end();
			});
		} else {
			res.send('Please enter username');
			res.end();
		}
	}
});

app.get("/logout", function(req,res){
	req.session.username = null;
	req.session.loggedin = false; 
	// req.logout();
	res.redirect('/');
});
// app.get('/account', function(req,res){
// 	if(req.session.loggedin) {
// 		res.render("profile.ejs", {student : student})
// 	} else {
// 		res.send('Please login to view this page');
// 	}
// 	res.end();
// });