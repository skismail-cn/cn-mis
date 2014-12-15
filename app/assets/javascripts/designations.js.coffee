# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
	$('body').on "click", "#Select_all_designations", ->  
	    if ($(this).is(':checked'))
	      $('.check_designation').attr('checked', true)
	    else
	      $('.check_designation').attr('checked', false)
$(document).ready(ready)
$(document).on('page:load', ready)
