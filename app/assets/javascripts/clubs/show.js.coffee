$(document).ready  ->
  clubView = new Wormies.Views.ClubView
    el: $(".club")
    model: new Wormies.Models.Club app_config.club
  
  window.app = new Wormies.Models.App app_config
  app.setup()

  view = new Wormies.Views.AppView
    model: app
    el: $(".app")
  view.render()

  app.start()
