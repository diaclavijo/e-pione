
var show_modal=(function(){
    if( $('#error_explanation_modal').length > 0 ){
        $('#modalEnterScore').modal('show');
    };
});

$(document).ready(show_modal);
$(document).on('page:load', show_modal);
