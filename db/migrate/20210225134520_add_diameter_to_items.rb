class AddDiameterToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :diameter, :integer
  end
end
