class CreateImpairments < ActiveRecord::Migration
  def change
    create_table :impairments do |t|
      t.references :disability, index: true
      t.references :user, index: true
      t.integer :severity
      t.text :other
      t.text :supportRequired

      t.timestamps
    end
  end
end
