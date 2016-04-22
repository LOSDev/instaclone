# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $ac = $("#search_term").autocomplete(
    source: "/search"
    select: (event, ui) ->
      window.location.href = "/users/" + ui.item.slug
  )

  $ac.data("ui-autocomplete")._renderItem = (ul, item) ->
    return $( "<li>" )
      .append( "<img src='#{item.avatar}' width='40'>&nbsp;&nbsp;" + item.username)
      .appendTo( ul )
