class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :postid
      t.string :name
      t.string :bodycomment

      t.timestamps
    end
  end
end
