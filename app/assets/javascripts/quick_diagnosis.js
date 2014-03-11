
var abc = (function(){
    $('#quick_diagnosis_education_select').change(function() {
        var current_value = $(this).find('option:selected').val();
        if(current_value == "-1"){
            $("#quick_diagnosis_education_div").show();
            $('#quick_diagnosis_education').val('');
        }else{
            $("#quick_diagnosis_education_div").hide();
            $('#quick_diagnosis_education').val(current_value);
        };
    });
});

// There is an error related to the turbolinks
$(document).ready(abc);
$(document).on('page:load', abc);
// More detailed explanation here
// http://stackoverflow.com/questions/17600093