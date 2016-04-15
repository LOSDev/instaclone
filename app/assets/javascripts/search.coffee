# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $ac = $("#search_term").autocomplete(
    source: "/search"
  )

  $ac.data("ui-autocomplete")._renderItem = (ul, item) ->
    return $( "<li>" )
      .append( "<a href='/users/#{item.slug}'><img src='#{item.avatar}' width='44'>&nbsp;&nbsp;" + item.username + "</a>" )
      .appendTo( ul )
