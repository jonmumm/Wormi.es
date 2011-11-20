# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("#club_volume_id").tokenInput "https://www.googleapis.com/books/v1/volumes?key=AIzaSyD5a1RmDzOb8csAUwc29uZhF7jdsL48yYI",
    jsonContainer: "items"
    tokenLimit: 1
    onResult: (results) ->
      $.each results.items, (index, value) ->
        value.name = value.volumeInfo.title

      console.log results
      return results
