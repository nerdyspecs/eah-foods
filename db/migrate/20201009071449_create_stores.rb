class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.references :user, null: false, foreign_key: true
      t.string :organisation_name
      t.string :unit
      t.string :street_address
      t.string :postal_code
      t.string :city
      t.string :state
      t.string :country
      t.timestamps
    end
  end
end
