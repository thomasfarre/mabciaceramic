class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :country
      t.string :street
      t.string :street_detail
      t.integer :zipcode
      t.integer :phone
      t.string :city

      t.timestamps
    end
  end
end
