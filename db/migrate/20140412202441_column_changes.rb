class ColumnChanges < ActiveRecord::Migration
  def change
        change_column(:educations, :disabilityDeptRating, :integer)
    change_column(:educations, :courseDeptRating, :integer)
    change_column(:universities, :disabilityDeptRating, :decimal ,precision: 3, scale: 2)
    change_column(:universities, :courseDeptRating, :decimal ,precision: 3, scale: 2)

  end
end
