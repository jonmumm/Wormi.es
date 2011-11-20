require 'opentok'

class Club < ActiveRecord::Base
  validates :volume_id, :start_time, :admin_password, :admin_name, :presence => true

  before_create :generate_session

  scope :future, lambda { where("start_time > ?", Time.now ) }

  default_scope order("start_time ASC").future

  private
    def generate_session
      opentok = OpenTok::OpenTokSDK.new APP_CONFIG['opentok_api_key'], APP_CONFIG['opentok_api_secret'], :api_url => "https://api.opentok.com/hl"

      self.session_id = opentok.create_session.to_s 
    end
end
