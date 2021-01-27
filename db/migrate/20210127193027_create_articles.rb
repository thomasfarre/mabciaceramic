class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :category
      t.text :content
      t.text :description

      t.timestamps
    end
  end
end
