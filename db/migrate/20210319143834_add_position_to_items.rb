class AddPositionToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :position, :string, default: "center"
  end
end
