Wormies.Views.PanelView = Backbone.View.extend
  initialize: ->
    app.get('session').addEventListener 'sessionConnected', @onSessionConnect
    app.get('session').addEventListener 'streamCreated', $.proxy @onStreamCreate, @
    app.get('session').addEventListener 'streamPropertyChanged', $.proxy @onStreamPropertyChange, @

  template: JST["backbone/templates/panel"]

  render: ->
    @el.html @template

  onSessionConnect: ->
    $(".startShowBtn").removeAttr 'disabled'
    $(".joinShowBtn").removeAttr 'disabled'

  onStreamPropertyChange: (event) ->
    connectionId = event.stream.connection.connectionId
    if connectionId is app.get('session').connection.connectionId
      if event.changedProperty is "hasAudio"
        if event.newValue
          $(".shift", @el).html "<strong>You are talking.</strong>"
        else
          $(".shift", @el).html "Press <strong>shift</strong> to talk."

  onStreamCreate: (event) ->
    connectionId = event.streams[0].connection.connectionId
    if app.get('session').connection.connectionId is connectionId
      $(".admin", @el).fadeOut('fast')
      $(".shift", @el).delay(2000).fadeIn('fast')

  events:
    "click .startShowBtn": "onStartShowClick"
    "click .stopShowBtn": "onStopShowClick"
    "click .joinShowBtn": "onJoinShowClick"
    "click .leaveShowBtn": "onLeaveShowClick"

  onStartShowClick: ->
    $(document).trigger 'startShow'
    $(".startShowBtn").attr 'disabled', 'disabled'
    $(".stopShowBtn").removeAttr 'disabled'

  onStopShowClick: ->
    $(document).trigger 'stopShow'
    $(".stopShowBtn").attr 'disabled', 'disabled'

  onJoinShowClick: ->
    $(document).trigger 'joinShow'
    $(".joinShowBtn").attr 'disabled', 'disabled'
    $(".leaveShowBtn").removeAttr 'disabled'

  onLeaveShowClick: ->
    $(document).trigger 'leaveShow'
    $(".leaveShowBtn").attr 'disabled', 'disabled'
