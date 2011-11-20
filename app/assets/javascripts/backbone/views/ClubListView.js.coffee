Wormies.Views.ClubListView = Backbone.View.extend
  initialize: ->
    @collection.bind 'add', $.proxy @onClubAdd, @

  onClubAdd: (club, collection) ->
    clubEl = $(@make "li")

    clubView = new Wormies.Views.ClubView
      el: clubEl
      model: club

    clubEl.appendTo @el
