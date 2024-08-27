class CreateStores < ActiveRecord::Migration[7.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.text :description, null: true
      t.decimal :longitude
      t.decimal :latitude
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
