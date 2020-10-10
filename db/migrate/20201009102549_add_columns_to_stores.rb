class AddColumnsToStores < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :halal, :bool
  end
end
