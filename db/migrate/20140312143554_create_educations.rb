class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.references :User, index: true
      t.references :Course, index: true
      t.references :University, index: true
      t.date :startDate
      t.date :endDate
      t.text :accessibilityReview
      t.text :supportRequested
      t.boolean :supportReceived
      t.text :reason
      t.decimal :disabilityDeptRating, precision: 2, scale: 2
      t.decimal :courseDeptRating, precision: 2, scale: 2

      t.timestamps
    end
  end
end
