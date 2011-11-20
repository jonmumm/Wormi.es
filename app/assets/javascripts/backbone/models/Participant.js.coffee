Wormies.Models.Participant = Backbone.Model.extend
  initialize: ->
    app.get('session').addEventListener 'streamCreated', $.proxy @onStreamCreate, @

  defaults:
    id: "myPublisher"
    state: "participate"

  onStreamCreate: (event) ->
    stream = event.streams[0]
    if @id is "myPublisher" and stream.connection.connectionId is app.get('session').connection.connectionId

      @set
        id: stream.streamId
        stream: stream
        state: 'participate'
