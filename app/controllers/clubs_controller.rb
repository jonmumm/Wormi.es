require 'opentok'

class ClubsController < ApplicationController

  before_filter :authenticate, :only => [:admin]
  before_filter :init_opentok, :only => [:show, :admin]

  # GET /clubs
  # GET /clubs.json
  def index
    @clubs = Club.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @clubs }
    end
  end

  # GET /clubs/1
  # GET /clubs/1.json
  def show
    @club = Club.find(params[:id])
    @moderator = false
    @token = generate_token OpenTok::RoleConstants::PUBLISHER

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @club }
    end
  end


  def admin
    @club = Club.find(params[:id])
    @moderator = true
    @token = generate_token OpenTok::RoleConstants::MODERATOR

    respond_to do |format|
      format.html { render :action => "show" }
      format.json { render :json => @club }
    end
  end

  # GET /clubs/new
  # GET /clubs/new.json
  def new
    @club = Club.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @club }
    end
  end

  # GET /clubs/1/edit
  def edit
    @club = Club.find(params[:id])
  end

  # POST /clubs
  # POST /clubs.json
  def create
    @club = Club.new(params[:club])

    respond_to do |format|
      if @club.save
        format.html { redirect_to @club, :notice => 'Club was successfully created.' }
        format.json { render :json => @club, :status => :created, :location => @club }
      else
        format.html { render :action => "new" }
        format.json { render :json => @club.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clubs/1
  # PUT /clubs/1.json
  def update
    @club = Club.find(params[:id])

    respond_to do |format|
      if @club.update_attributes(params[:club])
        format.html { redirect_to @club, :notice => 'Club was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @club.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.json
  def destroy
    @club = Club.find(params[:id])
    @club.destroy

    respond_to do |format|
      format.html { redirect_to clubs_url }
      format.json { head :ok }
    end
  end

  private
  def init_opentok
    @opentok = OpenTok::OpenTokSDK.new APP_CONFIG['opentok_api_key'], APP_CONFIG['opentok_api_secret'], :api_url => "https://api.opentok.com/hl"
  end

  def generate_token(role)
    @opentok.generate_token :session_id => @club.session_id, :role => role
  end

  def authenticate
    @club = Club.find(params[:id])

    authenticate_or_request_with_http_basic do |username, password|
      username == @club.admin_name && password == @club.admin_password
    end

    session[:user_id] = @club.admin_name
  end
end
