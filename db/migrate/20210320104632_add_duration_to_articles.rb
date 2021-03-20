class AddDurationToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :duration, :integer
  end
end
