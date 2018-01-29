/*Validates til searchbox*/
function SearchClick(elem, style) {
    var Search = document.getElementById("txtSearch").value;

    if (Search === "") {

        alert("Please type something in the search box");

    }
}

/*Validate til Subscribe*/
function Subscribe(elem, style) {
    var Name = document.getElementById("txtName").value;
    var Email = document.getElementById("txtEmail").value;

    if (Name === "" || Email === "") {

        alert("Please fill out both fields to subscribe");

    }
}


/*Validates til login*/
function btnLogin(elem, style) {
    var Username = document.getElementById("txtLoginName").value;
    var Password = document.getElementById("txtLoginPass").value;


    if (Username === "" || Password === "") {

        alert("Please fill out both fields");

    }
}

/*Slider*/
function Slider() 
{
    var description = [
       "Content/images/COLOURBOX3326755.jpg",
       "Content/images/COLOURBOX4760095.jpg",
       "Content/images/COLOURBOX6749125.jpg",
       "Content/images/COLOURBOX6996415.jpg",
       "Content/images/COLOURBOX7430806.jpg",
       "UploadedImages/detonation-best-selling-watches-diamond-shine.jpg",

    ];

    var size = description.length
    var x = Math.floor(size * Math.random())
    var a = Math.floor(size * Math.random())
    var b = Math.floor(size * Math.random())
    var c = Math.floor(size * Math.random())
    var d = Math.floor(size * Math.random())

    document.getElementById('image').src = description[x];
    document.getElementById('image2').src = description[a];
    document.getElementById('image3').src = description[b];
    document.getElementById('image4').src = description[c];
    document.getElementById('image5').src = description[d];



}
/*Slider postback*/
var description = [
       "Content/images/COLOURBOX3326755.jpg",
       "Content/images/COLOURBOX4760095.jpg",
       "Content/images/COLOURBOX6749125.jpg",
       "Content/images/COLOURBOX6996415.jpg",
       "Content/images/COLOURBOX7430806.jpg",
       "UploadedImages/detonation-best-selling-watches-diamond-shine.jpg",

];

var size = description.length
var x = Math.floor(size * Math.random())
var a = Math.floor(size * Math.random())
var b = Math.floor(size * Math.random())
var c = Math.floor(size * Math.random())
var d = Math.floor(size * Math.random())
document.getElementById('image').src = description[x];
document.getElementById('image2').src = description[a];
document.getElementById('image3').src = description[b];
document.getElementById('image4').src = description[c];
document.getElementById('image5').src = description[d];




