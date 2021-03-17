class RemoveContentFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :content, :text
  end
end
