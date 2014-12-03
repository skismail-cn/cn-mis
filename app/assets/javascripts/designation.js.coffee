# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#Select_all_designations').click ->
    if ($(this).is(':checked'))
        $('.check_designation').attr('checked', true)
    else 
        $('.check_designation').attr('checked', false)
