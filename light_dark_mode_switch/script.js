var switchdiv = document.getElementById("switch");
var btn = document.getElementById("switchbtn");

btn.innerHTML = "Light Mode";

function switchFunction() {
    if (btn.innerHTML == "Light Mode") {
        document.body.style.backgroundColor = "rgb(80, 80, 80)";
        btn.style.backgroundColor = "rgb(50, 50, 50)";
        btn.style.color = "rgb(230, 230, 230)";
        btn.innerHTML = "Dark Mode";
    }
    else if (btn.innerHTML == "Dark Mode") {
        document.body.style.backgroundColor = "var(--light-main)";
        btn.style.backgroundColor = "rgb(149, 194, 43)";
        btn.style.color = "rgb(0, 0, 0)";
        btn.innerHTML = "Light Mode";
    }
}