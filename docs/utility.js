    var sideNav = document.getElementById("vMenu")
    var icon = document.getElementById("icon")

    sideNav.style.left = "-250px";
    icon.src="Media/menu_FILL0_wght400_GRAD0_opsz24.svg";

    icon.onclick = function(){
        if(sideNav.style.left == "-250px"){
            sideNav.style.left = "0";
            icon.src="Media/close_FILL0_wght400_GRAD0_opsz24.svg";
        }
        else{
            sideNav.style.left = "-250px";
            icon.src="Media/menu_FILL0_wght400_GRAD0_opsz24.svg";
        }
    }