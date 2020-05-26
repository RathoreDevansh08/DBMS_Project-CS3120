var express = require("express");
var app     = express();
var mysql   = require("mysql");
var path    = require("path");
var bodyParser = require("body-parser");
var async   = require("async");

var server = app.listen(4200, function(req,res) {
   console.log("Server is running");
});

app.use("/company1", express.static("public"));
app.use("/company_students_applied", express.static("public"));
app.use("/company_students_selected", express.static("public"));
app.use("/company_students_applied_list", express.static("public"));
app.use("/company_students_selected_list", express.static("public"));
app.use("/company_students_applied_view", express.static("public"));
app.use("/company_students_selected_view", express.static("public"));
app.use("/application", express.static("public"));
app.use("/verify", express.static("public"));




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

app.use(express.static("public"));
app.use("/company", express.static("public"));

app.get("/", function(req,res){
   res.render("login.ejs");
});

app.get("/comp_profile_update",  function(req,res){
	// console.log(req);
	if(req.session.loggedin)
	{
		connection.query('select * from company where company_id = ?', [req.session.username], function(err,results,fields){
			if(results.length > 0){
				res.render("company/comp_profile_update.ejs", {company: results});
			} else {
				res.send("Some error occured");
			}
		});
	}
	else {
		res.send("Your are not logged in");
	}
});

app.get("/comp_job_profile_list", function(req,res){
	if(req.session.loggedin)
	{
		connection.query('select * from company_req where company_id = ?', [req.session.username], function(err,results,fields){
		res.render("company/comp_job_profile_list.ejs", {company: results});
		});
	}
	else {
		res.send("Your are not logged in");
	}
});

app.get("/company1/:company_id", function(req,res){
	if(req.session.loggedin)
	{
		connection.query('select * from company_req where company_id = ?', [req.params.company_id],function(err, results,fields){
		res.render("company/comp_job_profile_view.ejs", {company: results});
	});
	}
});

app.get("/company_students_applied_list/:application_id", function(req,res){
	if(req.session.loggedin)
	{
		connection.query('select * from applied where application_id = ?', [req.params.application_id],function(err, results,fields){
		res.render("company/comp_applied_students_list.ejs", {students: results});
	});
	}
	else{
		res.send("Some error occured");
	}
});

app.get("/company_students_selected_list/:application_id", function(req,res){
	if(req.session.loggedin)
	{
		connection.query('select * from selected where application_id = ?', [req.params.application_id],function(err, results,fields){
		res.render("company/comp_selected_students_list.ejs", {students: results});
	});
	}
});

app.get("/company_students_applied_view/:student_id", function(req,res){
	if(req.session.loggedin)
	{
		connection.query('select * from student where student_id = ?', [req.params.student_id],function(err, results,fields){
		res.render("student/profile_updated.ejs", {student: results});
	});
	}
});

app.get("/company_students_selected_view/:student_id", function(req,res){
	if(req.session.loggedin)
	{
		connection.query('select * from student where student_id = ?', [req.params.student_id],function(err, results,fields){
		res.render("student/profile_updated.ejs", {student: results});
	});
	}
});

app.get("/company_details", function(req,res){
	if(req.session.usertype=="tpo"){
		connection.query('select C.company_id,C.name,ifnull(Ca.num_verified,0) as num_verified,ifnull(Ca.total,0) as total from company as C left join company_applications as Ca on C.company_id=Ca.company_id', function(err,results,fields){
			res.render("tpo/company_details.ejs", {companies: results});
		});
	}
});

app.get("/company/:company_id", function(req,res){
	if(req.session.usertype=="tpo"){
		connection.query('select * from company_req where company_id=?',[req.params.company_id],function(err,results,fields){
			res.render('tpo/comp.ejs', {applications: results});
		});
	}
});

app.get("/application/:application_id", function(req,res){
	if(req.session.usertype=="tpo"){
		connection.query('select C.name,Cr.* from company_req as Cr,company as C where C.company_id=Cr.company_id and Cr.application_id=?', [req.params.application_id], function(err,results,fields){
			res.render('tpo/application_details.ejs', {application: results});
		});
	}
});

app.get('/verify/:application_id', function(req,res){
	if(req.session.usertype='tpo'){
		connection.query('update company_req set verified=1 where application_id=?', [req.params.application_id], function(err,results,fields){
			connection.query('select company_id from company_req where application_id=?', [req.params.application_id], function(er,result,field){
				console.log(result);
				res.redirect("/company/"+result[0].company_id);
			});
		});
	}
});

app.get("/company_students_applied/:company_id", function(req,res){
	// console.log("enter");
	if(req.session.usertype=="company"){
		connection.query('select * from company_req where company_id = ?',[req.params.company_id], function(err, results, fields)
		{
			res.render("company/comp_job_profile_list2.ejs",{company: results});
		});
	}
	else
	{
		res.send("some error occured");
	}
});

app.get("/company_students_selected/:company_id", function(req,res){
	// console.log("enter");
	if(req.session.usertype=="company"){
		connection.query('select * from company_req where company_id = ?',[req.params.company_id], function(err, results, fields)
		{
			res.render("company/comp_job_profile_list3.ejs",{company: results});
		});
	}
	else
	{
		res.send("some error occured");
	}
});

app.get("/add_job_profile", function(req,res){
	if(req.session.loggedin)
	{
		res.render("company/comp_job_profile.ejs");
	}

	else {
		res.send("Your are not logged in");
	}
});

app.get("/company_profile", function(req,res){
	if(req.session.loggedin)
	{
		connection.query('select * from company where company_id = ?', [req.session.username], function(err,results,fields){
			if(results.length > 0){
				res.render("company/company_profile.ejs", {company: results});
			} else {
				res.send("Some error occured");
			}
		});
	}
	else {
		res.send("Your are not logged in");
	}
});

app.get("/tpo_profile_update", function(req,res){
	// console.log(req);
	if(req.session.username="231701013")
	{
		connection.query('select * from tpo where tpo_id = ?', [req.session.username], function(err,results,fields){
			if(results.length > 0){
				// console.log(results);
				res.render("tpo/tpo_profile_update.ejs", {tpo: results});
			} else {
				res.send("Some error occured");
			}
		});
	}
	else {
		res.send("Your are not logged in as tpo");
	}
});


app.get("/student_details", function(req,res){
	// console.log(req.session);
	if(req.session.usertype=="tpo")
	{
		res.render("tpo/student_details.ejs")
	}
});

app.post("/student_search", function(req,res){
	if(req.session.usertype=="tpo")
	{
		var username = req.body.username;
		if(username){

			connection.query('select * from student where student_id=?', [username], function(err,results,fields){
				if (results.length > 0){
					req.session.loggedin = true;
					req.session.username = username;
					res.render("student/profile_updated.ejs", {student: results});
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

app.get("/tpo",  function(req,res){
	if(req.session.username=="231701013")
	{
		connection.query('select * from tpo where tpo_id = ?', [req.session.username], function(err,results,fields){
			if(results.length > 0){
				res.render("tpo/tpo.ejs", {tpo: results});
			} else {
				res.send("Some error occured");
			}
		});
	}
	else {
		res.send("Your are not logged in as tpo");
	}
});

app.get("/assign_stud_rep", function(req,res){
	if(req.session.userntype="tpo")
	{
		res.render("tpo/assign_stud_rep.ejs");
	}
	else
		res.send("You are not authorised to this page");
});

app.post("/assign_stud_rep", function(req,res){
	if(req.session.usertype=="tpo")
	{
		var username = req.body.username;
		connection.query('insert into student_rep values (?,?)',[username,username], function(err,results,fields){
			if(err)
			{
				console.log(err);
				res.send("Some error occured");
			}
			else
			{
				res.redirect("/assign_stud_rep");
			}
		});
	}
});

app.post("/unassign_stud_rep", function(req,res){
	if(req.session.usertype=="tpo")
	{
		var username = req.body.username;
		connection.query('delete from student_rep where student_id = ?',[username], function(err,results,fields){
			if(err)
			{
				console.log(err);
				res.send("Some error occured");
			}
			else
			{
				res.redirect("/assign_stud_rep");
			}
		});
	}
});

app.post("/update_tpo_profile", function(req,res){
	var phone = req.body.phone;
	var pass = req.body.pass;
	var email = req.body.email;
	var name = req.body.name;
	connection.query('update tpo set name = ?, email_id = ?, pass = ?, phone_number = ?', [name,email,pass,phone], function(err,results,fields)
	{
		if(err)
		{
			console.log(err);
			res.send("Some error occured");
		}else{
			res.redirect("/tpo_profile_update")
		}
	});
});

app.post("/update_company_profile", function(req,res){
	var phoneno = req.body.phoneno;
	// var pass = req.body.pass;
	var location = req.body.location;
	var about = req.body.about;
	var email_id = req.body.email_id;
	var name = req.body.name;
	var company_id = req.session.username;
	// console.log(location);
	// console.log(about);
	// console.log(name);
	connection.query('update company set name = ?, location = ?, about = ? , phoneno = ?, email_id = ? where company_id = ?', [name,location,about,phoneno,email_id,company_id], function(err,results,fields)
	{
		if(err)
		{
			console.log(err);
			res.send("Some error occured");
		}else{
			res.redirect("/comp_profile_update")
		}
	});
});

app.post("/add_new_job_profile", function(req,res){
	var posted_by = req.body.posted_by;
	var company_overview = req.body.company_overview;
	var vacancies = req.body.vacancies;
	var stipend = req.body.stipend;
	var skills = req.body.skills;
	var additional_info = req.body.additional_info;
	var selection_proc = req.body.selection_proc;
	var location = req.body.location;
	var intern_details = req.body.intern_details;
	var start_date = req.body.start_date;
	var last_date = req.body.last_date;
	var deadline = req.body.deadline;
	var profile_name = req.body.profile_name;
	var company_id = req.session.username;
	var str1 = "";
	var str2 = "";

	if (req.body.CSE == "1")
		str1 = str1 + "1";
	if (req.body.EE == "2")
		str1 = str1 + "2";
	if (req.body.CE == "3")
		str1 = str1 + "3";
	if (req.body.ME == "4")
		str1 = str1 + "4";
	if (req.body.elg1 == "1")
		str2 = str2 + "1";
	if (req.body.elg2 == "2")
		str2 = str2 + "2";
	if (req.body.elg3 == "3")
		str2 = str2 + "3";
	if (req.body.el4 == "4")
		str2 = str2 + "4";
	if (req.body.elg5 == "5")
		str2 = str2 + "5";
	if (req.body.elg6 == "6")
		str2 = str2 + "6";
	var verified = 0;
	console.log(posted_by,company_overview,vacancies,stipend,skills,additional_info, selection_proc,location,intern_details,start_date, last_date,deadline,str1,str2);
	connection.query('select count(*) as c from company_req',function(err, results,fields){
		if (err)
		{
			res.send("Some error occured");
		}else{
			var application_id = results[0].c+1;
			console.log("sa");
			console.log(application_id);
			connection.query('insert into company_req values (?, ?, ?, ?, ?, ?, ?,?, ?, ?,?,?,?,?,?,?,?,?)', [application_id,company_id,skills,str1,str2,vacancies,stipend,start_date,last_date,deadline,posted_by,company_overview,selection_proc,additional_info,location,intern_details,profile_name,verified], function(err,results,fields)
			{
				if(err)
				{
					console.log(err);
					res.send("Some error occured");
				}else{
					res.redirect("/comp_job_profile_list")
				}
			});

		}
	});
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
					req.session.usertype = "student";
					res.render("student/profile_updated.ejs", {student: results});
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
					req.session.usertype = "tpo";
					res.redirect("/tpo");
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
					req.session.usertype = "studentrep";
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
					req.session.usertype = "staff";
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
					req.session.usertype = "company";
					res.render("company/company_profile.ejs", {company: results});
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
					res.render("student/profile_updated.ejs", {student: results});
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
