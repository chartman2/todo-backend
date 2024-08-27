class Items < ActiveRecord::Migration[7.0]
  def change
    create_table :todo_items do |t|
      t.string :name
      t.references :user, foreign_key: true # Lien vers l'utilisateur qui a créé ou mis à jour l'item
      t.boolean :done
      t.references :scope, on_delete: :cascade

      t.timestamps
    end
  end
end
