class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :password
      t.integer :userType
      t.date :dob
      t.text :bio

      t.timestamps
    end
  end
end
