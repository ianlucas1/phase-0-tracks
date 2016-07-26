    function initElement() {  
        var p = document.getElementById("wildfire");  
        p.onmouseover = showMouseOver;
        p.onmouseout = showMouseOut;
        p.onclick = showAlert;
    };  

    function giveOrder() {
        var para = document.createElement("P");
        var t = document.createTextNode("Move your mouse over the fire to position your water balloon-equipped drone above it.");
        para.appendChild(t);
        document.body.appendChild(para);
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

    function addPinkBorder(event) {
        event.target.style.border = "5px solid pink";
    }

    var photo = document.getElementById("wildfire");
    photo.addEventListener("click", addPinkBorder);