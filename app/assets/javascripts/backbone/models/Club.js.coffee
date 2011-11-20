Wormies.Models.Club = Backbone.Model.extend
  initialize: ->
    $.ajax
      url: "https://www.googleapis.com/books/v1/volumes/#{@get('volume_id')}"
      data:
        key: "AIzaSyCajyqmym5AJZHojVvHzlxB8Aj15oPdaAg"
      dataType: "jsonp"
      success: $.proxy @onGetVolume, @

  onGetVolume: (volume) ->
    @set { volume: volume }
