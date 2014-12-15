# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $("#leave_member_id").change ->
  	$.ajax(
  		type: "POST",
  		data: { applicant: parseInt($(this).val(),10) },
  		url: "http://localhost:3000/leaves/fetchsuperior",
  		error: (jqXHR, textStatus, errorThrown) ->
            $('body').append "AJAX Error: #{textStatus}"
        success: (data, textStatus, jqXHR) ->
            $("#leave_reporting_to").html(data)
  	)

$(document).ready(ready)
$(document).on('page:load', ready)
