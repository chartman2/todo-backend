class Scopes < ActiveRecord::Migration[7.0]
  def change
    create_table :todo_scopes do |t|
      t.string :name
      t.string :nickname
 
      t.timestamps
    end
  end
end
