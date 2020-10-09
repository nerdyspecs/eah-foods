class AddColumnToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :store, null: false, foreign_key: true
    add_column :items, :price, :float
  end
end
