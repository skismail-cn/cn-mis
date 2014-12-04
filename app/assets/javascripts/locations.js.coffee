# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#Select_all_locations').click ->
    if ($(this).is(':checked'))
        $('.check_location').attr('checked', true)
    else 
        $('.check_location').attr('checked', false)
