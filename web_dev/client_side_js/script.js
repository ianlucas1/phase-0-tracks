var photos_ary = document.getElementsByClassName("image");
wildfire = photos_ary[0];
saved_kitten = photos_ary[1];
saved_kitten.hidden = true;

wildfire.addEventListener("mouseover", showMouseOver);
wildfire.addEventListener("mouseout", showMouseOut);
wildfire.addEventListener("click", switchPhotos);
wildfire.addEventListener("click", showAlert);

function giveOrder() { // the call for this function is in the button node of the index.html file
  var paragraph = document.createElement("p");
  var text = document.createTextNode("Move your mouse over the fire to position your water balloon-equipped drone above it.");
  paragraph.appendChild(text);
  document.getElementById("button").appendChild(paragraph);
};

function showMouseOver(event) {  
  var notice = document.getElementById("notice");
  notice.innerHTML = "You're over the target! Click on the fire to release the water balloon!!";
};

function showMouseOut(event) {
  var notice = document.getElementById("notice");
  notice.innerHTML = "You're off the target. Hurry and put it out!";
};

function showAlert(event) {
  alert("SPLASH! You have save an untold number of kittens, for which the Cat Gods will surely reward you.")
};

function switchPhotos(event) {
  event.target.hidden = true;   
  saved_kitten.hidden = false;
  notice.hidden = true;
}









