function slide1(){
    document.getElementById("main-slide01").style.display = "block";
    document.getElementById("main-slide02").style.display = "none";
    document.getElementById("main-slide03").style.display = "none";
    document.getElementById("main-label01").style.backgroundColor = "#276fd1";
    document.getElementById("main-label02").style.backgroundColor = "rgba(0,0,0,0.55)";
    document.getElementById("main-label03").style.backgroundColor = "rgba(0,0,0,0.55)";
}
function slide2(){
    document.getElementById("main-slide01").style.display = "none";
    document.getElementById("main-slide02").style.display = "block";
    document.getElementById("main-slide03").style.display = "none";
    document.getElementById("main-label01").style.backgroundColor = "rgba(0,0,0,0.55)";
    document.getElementById("main-label02").style.backgroundColor = "#276fd1";
    document.getElementById("main-label03").style.backgroundColor = "rgba(0,0,0,0.55)";
}
function slide3(){
    document.getElementById("main-slide01").style.display = "none";
    document.getElementById("main-slide02").style.display = "none";
    document.getElementById("main-slide03").style.display = "block";
    document.getElementById("main-label01").style.backgroundColor = "rgba(0,0,0,0.55)";
    document.getElementById("main-label02").style.backgroundColor = "rgba(0,0,0,0.55)";
    document.getElementById("main-label03").style.backgroundColor = "#276fd1";
}