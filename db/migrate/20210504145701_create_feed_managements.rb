class CreateFeedManagements < ActiveRecord::Migration[6.0]
  def change
    create_table :feed_managements do |t|
      t.integer :yesterday_leftover, default: 0, null: false
      t.integer :morning_addition, default: 0, null: false
      t.integer :noon_addition, default: 0, null: false
      t.integer :evening_addition, default: 0, null: false
      t.integer :today_leftover, default: 0, null: false
      t.integer :amount_eaten, null: false
      t.date    :created_on, null: false, unique: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
