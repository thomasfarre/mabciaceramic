class ChangeValueOfCountryToAdresses < ActiveRecord::Migration[6.0]
  def change
    change_column :adresses, :country, :string, default: "France"
  end
end
