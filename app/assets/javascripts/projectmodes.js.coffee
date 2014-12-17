# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $("#Select_all_projectmodes").click ->
    if $(this).is(":checked")
      $(".check_project_mode").attr "checked", true
    else
      $(".check_project_mode").attr "checked", false
    return

$(document).ready(ready)
$(document).on('page:load', ready)
