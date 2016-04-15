# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
renderHashtags = ->
  if $(".post-description").length
    str = $(".post-description").html().replace(/#(\S+)/g,'<a href="/hashtag/$1">#$1</a>')
    $(".post-description").html(str)
$ ->
  renderHashtags()

  $(document).ajaxSuccess ->
    renderHashtags()
