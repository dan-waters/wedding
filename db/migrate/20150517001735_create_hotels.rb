class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :url
      t.boolean :booked
      t.references :destination, index: true

      t.timestamps null: false
    end
    add_foreign_key :hotels, :destinations
  end
end
