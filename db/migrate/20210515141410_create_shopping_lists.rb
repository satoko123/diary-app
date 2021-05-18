class CreateShoppingLists < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_lists do |t|
      t.string    :item_name, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
    add_index :shopping_lists, [:item_name, :user_id], unique: true
  end
end
