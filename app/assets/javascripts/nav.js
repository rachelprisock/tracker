/**
 * Created by rachelprisock on 1/6/18.
 */
$( document ).on('turbolinks:load', function() {
    $('#menu-bar').click(function(){
        var left = $('#main-content');
        if(left.hasClass('col-md-11 col-11'))
        {
            $('#sidebar-menu').toggle("slide", { direction: "left" }, 250);
            left.removeClass("col-md-11 col-11").addClass("col-md-12 col-12");
        }
        else
        {
            left.removeClass("col-md-12 col-12").addClass("col-md-11 col-11");
            $('#sidebar-menu').toggle("slide", { direction: "left" }, 250);
        }

    });
});