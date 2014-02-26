
var abc = (function(){
    $('#patient_education_select').change(function() {
        var current_value = $(this).find('option:selected').val();
        if(current_value == "-1"){
            $("#patient_education_div").show();
            $('#patient_education').val('');
        }else{
            $("#patient_education_div").hide();
            $('#patient_education').val(current_value);
        };
    });
});

// There is an error related to the turbolinks  
$(document).ready(abc);
$(document).on('page:load', abc);
// More detailed explanation here
// http://stackoverflow.com/questions/17600093/rails-javascript-not-loading-after-clicking-through-link-to-helper