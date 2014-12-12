# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('#select_all_LS').click ->
    if ($(this).is(':checked'))
        $('.check_LS').attr('checked', true)
    else 
        $('.check_LS').attr('checked', false)

$(document).ready(ready)
$(document).on('page:load', ready)
