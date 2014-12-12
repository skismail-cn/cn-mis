# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('#select_all_skills').click ->
  	if($(this).is(':checked'))
  		$('.check_skill').attr('checked', true)
  	else
  		$('.check_skill').attr('checked',false)

$(document).ready(ready)
$(document).on('page:load', ready)
