Wormies.Views.AppView = Backbone.View.extend
  template: JST["backbone/templates/app"]

  render: ->
    connectView = new Wormies.Views.ConnectModalView
    connectView.render()

    panelView = new Wormies.Views.PanelView
      el: $(".panel")
    panelView.render()

    stageView = new Wormies.Views.StageView
      el: $(".stage")
      collection: app.get('participants')
