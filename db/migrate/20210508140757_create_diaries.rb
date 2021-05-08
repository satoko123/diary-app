class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.string :text
      t.float :weight
      t.date :created_on, null: false, unique: true
      t.references :user, null: false, foreign_key: true
      t.references :feed_management, foreign_key: true
      t.timestamps
    end
    add_index :diaries, [:created_on], unique: true
  end
end
