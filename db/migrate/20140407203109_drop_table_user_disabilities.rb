class DropTableUserDisabilities < ActiveRecord::Migration
  def change
    drop_table :user_disabilities
  end
end
