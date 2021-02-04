class RemoveAdressFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :adress, :string
    remove_column :users, :country, :string
    remove_column :users, :zipcode, :integer
    remove_column :users, :city, :string
  end
end
