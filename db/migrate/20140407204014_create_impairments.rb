class CreateImpairments < ActiveRecord::Migration
  def change
    create_table :impairments do |t|
      t.references :disability_id, index: true
      t.references :user_id, index: true
      t.integer :severity
      t.text :other
      t.text :supportRequired

      t.timestamps
    end
  end
end
