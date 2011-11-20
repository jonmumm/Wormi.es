Wormies.Models.Club = Backbone.Model.extend
  initialize: ->
    $.ajax
      url: "https://www.googleapis.com/books/v1/volumes/#{@get('volume_id')}"
      data:
        key: "AIzaSyD5a1RmDzOb8csAUwc29uZhF7jdsL48yYI"
      dataType: "jsonp"
      success: $.proxy @onGetVolume, @

  onGetVolume: (volume) ->
    @set { volume: volume }
