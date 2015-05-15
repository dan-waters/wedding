class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :name, null: false
      t.date :arrival_date, null: false
      t.date :departure_date, null: false
      t.references :honeymoon, null: false

      t.timestamps null: false
    end
  end
end
