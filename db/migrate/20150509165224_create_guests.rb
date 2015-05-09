class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :type
      t.string :name
      t.boolean :invited
      t.boolean :accepted

      t.timestamps null: false
    end
  end
end
