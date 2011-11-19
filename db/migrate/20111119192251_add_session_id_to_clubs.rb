class AddSessionIdToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :session_id, :string
  end
end
