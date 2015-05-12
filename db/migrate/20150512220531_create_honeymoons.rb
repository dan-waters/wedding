class CreateHoneymoons < ActiveRecord::Migration
  def change
    create_table :honeymoons do |t|
      t.date :from
      t.date :to

      t.timestamps null: false
    end
  end
end
