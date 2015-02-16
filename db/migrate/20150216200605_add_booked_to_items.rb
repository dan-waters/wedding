class AddBookedToItems < ActiveRecord::Migration
  def change
    add_column :items, :booked, :boolean, default: false, null: false
  end
end
