class HomeController < ApplicationController
  def index
    @clubs = Club.all
    @club = Club.new
  end

  def launch
    render :action => 'launch', :layout => 'splash'
  end

end
