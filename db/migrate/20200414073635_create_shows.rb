class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.text :text
      t.text :content
      t.string :image
      t.references :post, foreign_key: true
      t.timestamps
    end
  end
end
