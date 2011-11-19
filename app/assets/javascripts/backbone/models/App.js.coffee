Wormies.Models.App = Backbone.Model.extend
  setup: ->
    @set
      participants: new Wormies.Collections.ParticipantCollection
      events: new Wormies.Collections.EventManager

  start: ->
    @get('session').connect @get('opentok_api_key'), @get('opentok_token')
