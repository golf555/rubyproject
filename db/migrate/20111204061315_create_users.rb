class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :sname
      t.string :uname
      t.string :email
      t.string :pw

      t.timestamps
    end
  end
end
