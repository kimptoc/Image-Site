$(document).ready(function() {
    /*Since all the tabs are hidden with css we are displaying the tab with class .active_tab using fadeIn()
     function. If you just want it to show with no effect, just put show() instead of fadeIn() */
    $('.active_tab').fadeIn();

    //when a tab link is clicked...
    $('.tab_link').live('click', function(event) {

        /*...prevent the default behaviour...*/
        event.preventDefault();

        /* ...remove the tab_link_selected class from current active link... */
        $('.tab_link_selected').removeClass('tab_link_selected');

        /* ...and add it to the new active link */
        $(this).addClass('tab_link_selected');

        /*...get the title attribute (which corensponds to the id of the needed text container),
         but you can use any attribute you want*/
        var container_id = $(this).attr('title');

        //...animate the current active_tab by changing it's height and opacity ...'
        $('.active_tab').animate({

            height : 'toggle' , opacity : 'toggle'

            //...and when that animation ends...
        }, function() {

            //...remove the active_tab class from the current active tab...
            $(this).removeClass('active_tab');

            //...and add that class to the tab that corensponds the clicked link...
            $(container_id).addClass('active_tab');

            //...and animate the new active_tab by using toggle on height and opacity again...
            $('.active_tab').animate({

                height : 'toggle' , opacity : 'toggle'

            });
        });

    });
});