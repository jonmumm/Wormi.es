Wormies.Models.Club = Backbone.Model.extend
  initialize: ->
    $.ajax
      url: "https://www.googleapis.com/books/v1/volumes/#{@get('volume_id')}"
      dataType: "jsonp"
      success: $.proxy @onGetVolume, @

  onGetVolume: (volume) ->
    @set { volume: volume }
