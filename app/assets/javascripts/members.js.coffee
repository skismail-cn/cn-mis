# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#member_department_id").change ->
  	$.ajax(
  		type: "POST",
  		data: { department: $(this).val() },
  		url: "http://localhost:3000/members/fetchdesignation",
  		error: (jqXHR, textStatus, errorThrown) ->
            $('body').append "AJAX Error: #{textStatus}"
        success: (data, textStatus, jqXHR) ->
            $("#member_designation_id").html(data)
  	)
