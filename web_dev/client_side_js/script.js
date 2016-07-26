console.log("The script is running!");

var photo = document.getElementById("wildfire");
var photo = document.getElementById("wildfire");

function initElement() {
  photo.onmouseover = showMouseOver;
  photo.onmouseout = showMouseOut;
  photo.onclick = showAlert;
};  

function giveOrder() {
  var paragraph = document.createElement("P");
  var text = document.createTextNode("Move your mouse over the fire to position your water balloon-equipped drone above it.");
  paragraph.appendChild(text);
  document.body.appendChild(paragraph);
};

function showMouseOver() {  
  var notice = document.getElementById("notice");
  notice.innerHTML = 'You are over the target now. Click it to release the water balloon!';
};

function showMouseOut() {
  var notice = document.getElementById("notice");
  notice.innerHTML = 'You are no longer over the target.';
};

function showAlert() {
  alert("SPLASH! Congrats on a successful mission! You have save an untold number of wildcat kittens, for which the cat gods will surely reward you.")
};

function hidePhoto() {
  event.target.hidden = true;
};

function addPinkBorder(event) {
  event.target.style.border = "5px solid pink";
};

// photo.addEventListener("click", addPinkBorder);
photo.addEventListener("click", hidePhoto);



