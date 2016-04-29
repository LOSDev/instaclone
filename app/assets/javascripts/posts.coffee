# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
renderHashtags = ->
  if $(".post-description").length
    str = $(".post-description").text().replace(/#(\S+)/g,'<a href="/hashtag/$1">#$1</a>')
    $(".post-description").html(str)

previewImage = ->
  if $(".upload-preview img").length
    preview = $(".upload-preview img")

    $(".file").change (event) ->
      input = $(event.currentTarget)
      file    = document.querySelector('input[type=file]').files[0]
      reader = new FileReader()
      reader.onload = (e) ->
        image_base64 = e.target.result
        preview.attr("src", image_base64)
      reader.readAsDataURL(file)
      $(".image-filters label").removeClass("active")
      $(".upload-preview figure").removeClass().addClass("no_filter")
      $(".image-filters input[value=no_filter]").parent().addClass("active")

applyFilter = (el) ->
  $val = el.children().val()
  $(".image-filters label").removeClass("active")
  el.addClass("active")
  $(".upload-preview figure").removeClass().addClass($val)

$ ->
  renderHashtags()
  previewImage()
  $(".image-filters label").click ->
    applyFilter($(this))


  $(document).ajaxSuccess ->
    renderHashtags()
    if $(".modal").length
      loadComments()
