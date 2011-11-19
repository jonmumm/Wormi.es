class Club < ActiveRecord::Base
  validates :volume_id, :start_time, :admin_password, :admin_name, :presence => true
end
