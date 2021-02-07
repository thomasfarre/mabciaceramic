class RenameStateToStatusInOrders < ActiveRecord::Migration[6.0]
  def up
    rename_column :orders, :state, :status
  end

  def down
    rename_column :orders, :status, :state
  end
end
