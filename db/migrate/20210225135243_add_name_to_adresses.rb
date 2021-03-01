class AddNameToAdresses < ActiveRecord::Migration[6.0]
  def change
    add_column :adresses, :name, :string
  end
end
