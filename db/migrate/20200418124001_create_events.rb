class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :title
      t.text :text
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
