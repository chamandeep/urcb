class CreatePostComments < ActiveRecord::Migration
  def change
    create_table :post_comments do |t|
      t.references :user, index: true
      t.references :post, index: true
      t.string :comment

      t.timestamps
    end
  end
end
