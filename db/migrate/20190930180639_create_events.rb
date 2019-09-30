class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :start
      t.datetime :end
      t.string :location
      t.integer :creator_id

      t.timestamps
    end
  end
end
