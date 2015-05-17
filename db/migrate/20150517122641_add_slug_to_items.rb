class AddSlugToItems < ActiveRecord::Migration
  def change
    add_column :items, :slug, :string, index: true
    Item.all.map(&:save!)
  end
end
