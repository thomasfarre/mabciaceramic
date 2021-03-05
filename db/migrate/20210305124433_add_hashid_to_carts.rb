class AddHashidToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :hashid, :string
  end
end
