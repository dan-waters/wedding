class CreateGuestTypes < ActiveRecord::Migration
  def change
    create_table :guest_types do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
