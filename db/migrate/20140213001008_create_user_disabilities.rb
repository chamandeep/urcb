class CreateUserDisabilities < ActiveRecord::Migration
  def change
    create_table :user_disabilities do |t|
      t.integer :disability_id
      t.integer :user_id
      t.string :severity
      t.text :supportRequired

      t.timestamps
    end
  end
end
