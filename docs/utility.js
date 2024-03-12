var sideNav = document.getElementById("vMenu")
var icon = document.getElementById("icon")

sideNav.style.left = "-250px";
icon.src="Media/menu_FILL0_wght400_GRAD0_opsz24.svg";
icon.style.backgroundColor = "#262626";

icon.onclick = function(){
    if(sideNav.style.left == "-250px"){
        sideNav.style.left = "0";
        icon.src="Media/close_FILL0_wght400_GRAD0_opsz24.svg";
        icon.style.backgroundColor = "#EEEEEE";
    }
    else{
        sideNav.style.left = "-250px";
        icon.src="Media/menu_FILL0_wght400_GRAD0_opsz24.svg";
        icon.style.backgroundColor = "#262626";
    }
}

let slideIndex = 0;
showSlides(slideIndex);

function plusSlides(n) {
    showSlides(slideIndex += n);
}

function currentSlide(n) {
    showSlides(slideIndex = n - 1);
}

function showSlides(n) {
    let i;
    let slides = document.getElementsByClassName("slides");

    if (n >= slides.length) {
        slideIndex = 0;
    }

    if (n < 0) {
        slideIndex = slides.length - 1;
    }

    for (i = 0; i < slides.length; i++) {
        slides[i].classList.remove("show", "next", "prev");
    }

    slides[slideIndex].classList.add("show");

    if (n > 0) {
        slides[slideIndex - 1].classList.add("prev");
    }

    if (n < slides.length - 1) {
        slides[slideIndex + 1].classList.add("next");
    }
}