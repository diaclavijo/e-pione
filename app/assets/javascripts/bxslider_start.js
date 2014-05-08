/**
 * Created by yarilo on 29/04/14.
 */


function slider(){
    $('.bxslider').bxSlider({
        auto: true,
        speed:1500,
        pause: 5000,
        pager:false,
        controls: true,
        slideWidth:800,
        useCSS:false

        // Creo que tendría que poner useCSS: false para que funcione en IE
    });

}

$(document).ready(slider);

/*Esta puta mierda:
 http://stackoverflow.com/questions/2638292/after-travelling-back-in-firefox-history-javascript-wont-run
 */
/*
 */


