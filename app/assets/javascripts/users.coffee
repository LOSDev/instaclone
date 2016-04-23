# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on
  mouseover: ->
    $(this).parent().find(".overlay").css("visibility","visible")

  mouseout: ->
    $(this).parent().find('.overlay').css("visibility","hidden")

, '.posts figure'

$(document).on
  click: (event) ->
    loadPostModal(event, $(this))
, '.next-button, .previous-button, .posts a'



loadPostModal = (event, obj) ->
  elem = obj
  url = elem.attr('href')
  $.ajax
    url: url,
    dataType: 'script',
    success: (data) ->
      image = $(".posts a[href='#{url}']").parent()
      previous = image.next().find("a").attr("href")
      if previous
        $(".next-button").attr('href', previous)
      else
        $(".next-button").remove()
      next = image.prev().find("a").attr("href")
      if next
        $(".previous-button").attr('href', next)
      else
        $(".previous-button").remove()

  event.preventDefault()
  event.stopPropagation()
