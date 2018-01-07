/**
 * Created by rachelprisock on 1/6/18.
 */

$('#menu-bar').click(function(){
    $('#sidebar-menu').toggle();
    $('#main-content').toggleClass('col-md-12');
});

function showMenu() {
    document.getElementById("sidebar-menu").style.color = "red";
}
;
