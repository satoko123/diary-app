class CreateFeedManagements < ActiveRecord::Migration[6.0]
  def change
    create_table :feed_managements do |t|
      t.integer :yesterday_leftover, default: 0, null: false
      t.integer :morning_addition, default: 0, null: false
      t.integer :noon_addition, default: 0, null: false
      t.integer :evening_addition, default: 0, null: false
      t.integer :today_leftover, default: 0, null: false
      t.integer :amount_eaten, null: false
      t.date    :created_on, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
    add_index :feed_managements, [:created_on, :user_id], unique: true
  end
end
