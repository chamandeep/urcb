class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :name
      t.text :url
      t.text :disabilityURL
      t.decimal :disabilityDeptRating, precision: 2, scale: 2
      t.decimal :courseDeptRating, precision: 2, scale: 2

      t.timestamps
    end
  end
end
