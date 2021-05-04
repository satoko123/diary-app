class CreateFeedManagements < ActiveRecord::Migration[6.0]
  def change
    create_table :feed_managements do |t|
      t.timestamps
    end
  end
end
