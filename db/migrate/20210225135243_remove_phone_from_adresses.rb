class RemovePhoneFromAdresses < ActiveRecord::Migration[6.0]
  def change
    remove_column :adresses, :phone, :integer
  end
  def change
    add_column :adresses, :name, :string
  end
end
