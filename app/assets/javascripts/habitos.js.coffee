# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("#new_habito").on("ajax:success", (e, data, status, xhr) ->
    $("#new_habito").append xhr.responseText
  ).bind "ajax:error", (e, xhr, status, error) ->
    $("#new_habito").append "<p>ERROR</p>"