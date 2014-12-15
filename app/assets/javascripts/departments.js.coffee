# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('body').on "click", "#selectall_departments", ->  
      if ($(this).is(':checked'))
        $('div input').attr('checked', true)
      else
        $('div input').attr('checked', false)
$(document).ready(ready)
$(document).on('page:load', ready)

