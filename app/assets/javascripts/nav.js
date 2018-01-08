/**
 * Created by rachelprisock on 1/6/18.
 */
$( document ).on('turbolinks:load', function() {
    console.log("woo page is ready");
    $('#menu-bar').click(function(){
        var left = $('#main-content');
        if(left.hasClass('col-md-10'))
        {
            console.log("Updating from 10 to 12");
            $('#sidebar-menu').toggle("slide", { direction: "left" }, 250);
            left.removeClass("col-md-10").addClass("col-md-12");
        }
        else
        {
            console.log("Updating from 12 to 10");
            left.removeClass("col-md-12").addClass("col-md-10");
            $('#sidebar-menu').toggle("slide", { direction: "left" }, 250);
        }

    });
});