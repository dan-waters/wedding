class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :item, index: true
      t.references :person, index: true
      t.decimal :amount

      t.timestamps null: false
    end
    add_foreign_key :payments, :items
    add_foreign_key :payments, :people
  end
end
