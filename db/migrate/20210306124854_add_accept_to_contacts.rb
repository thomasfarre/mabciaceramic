class AddAcceptToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :accept, :boolean
  end
end
