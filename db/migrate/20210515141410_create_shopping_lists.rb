class CreateShoppingLists < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_lists do |t|
      t.string    :item_name, null: false
      t.timestamps
    end
    add_index :shopping_lists, [:item_name], unique: true
  end
end
