// why the (document).on('page:load', function() is necessary?
//
// http://stackoverflow.com/questions/17600093/rails-javascript-not-loading-after-clicking-through-link-to-helper

$(document).on('page:load', function(){
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