class HomeController < ApplicationController
  def index
    @clubs = Club.select("id, admin_name, start_time, volume_id").all
    @club = Club.new
  end

  def launch
    render :action => 'launch', :layout => 'splash'
  end

end
