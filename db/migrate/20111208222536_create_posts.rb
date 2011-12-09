class CreatePosts < ActiveRecord::Migration
  def change
    drop_table :posts
    create_table :posts do |t|
      t.string :author
      t.string :title
      t.string :postbody
      t.integer :own_user

      t.timestamps
    end
  end
end
