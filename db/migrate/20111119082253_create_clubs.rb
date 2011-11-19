class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :admin_name
      t.string :admin_password
      t.datetime :start_time
      t.string :volume_id

      t.timestamps
    end
  end
end
