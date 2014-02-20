var express = require("express");
var app = express();
var MongoDB = require("MongoDB");
var mongoose = require("mongoose");
var db = mongoose.connection;
var crypto = require("crypto");
var User = null, Message = null;

db.on("error", console.error);
db.once("open", function(){
	var user_schema = new mongoose.Schema( {
		username: String,
		password: String
	});
	var message_schema = new mongoose.Schema( {
		title: String, 
		content: String, 
		user_id: String
	});
	User = mongoose.model("User", user_schema);
	Message = mongoose.model("Message", message_schema);
});

mongoose.connect("mongodb://localhost/ILP_Project");

app.configure(function (){
	app.use(express.bodyParser());
	app.use(express.cookieParser());
});

app.post("/register", function(req, res){
	console.log(req.body);
	var shasum = crypto.createHash("sha256");
	shasum.update(req.body.username);
	var username = shasum.digest("Hex");
	console.log(username);
	var shasum2 = crypto.createHash("sha256");
	shasum2.update(req.body.password);
	var password = shasum2.digest("Hex");
	var newUser = new User({
		username: username,
		password: password
	});
	newUser.save(function(err, user){
		if (err) console.log("Error: " + err);
	});
});

app.post("/login", function(req, res){
	var post = req.body;
	var shasum = crypto.createHash("sha256");
	shasum.update(post.username);
	var username = shasum.digest("Hex");
	console.log(username);
	var shasum2 = crypto.createHash("sha256");
	shasum2.update(post.password);
	var password = shasum2.digest("hex");
	console.log(password);
	User.findOne({username: username}, function(err, user){
		if (user.password == password) {
			res.send("Success!");
		}
		else if (err) {
			console.log("Error: " + err);
		}
	});
	
});

app.post("/new_message", checkAuth, function(req, res){
	var newMessage = new Message({
		title: req.body.title,
		content: req.body.content,
		user_id: req.session.user_id
	});
	newMessage.save(function(err, message){
		if(err) console.log("Error: " + err);
	});
});

function checkAuth(req, res, next) {
	if (!req.session.user_id) {
		res.send("Invalid info");
	} else {
		next();
	}
}
console.log("Server running on port: 3000");
app.listen(3000);