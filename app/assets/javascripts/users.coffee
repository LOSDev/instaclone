# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on
  mouseover: ->
    $(this).parent().find(".overlay").css("visibility","visible")

  mouseout: ->
    $(this).parent().find('.overlay').css("visibility","hidden")
, '.posts figure'
