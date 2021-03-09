class ChangeDefaultValueOfStatusFromItems < ActiveRecord::Migration[6.0]
  def change
    change_column_default :items, :status, "available"
  end
end
