class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :status, default: 'pending'
      t.string :materials, array: true, default: []
      t.integer :width
      t.integer :length
      t.integer :height

      t.timestamps
    end
  end
end
