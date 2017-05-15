class CreateExplorations < ActiveRecord::Migration[5.0]
  def change
    create_table :explorations do |t|
      t.string :title
      t.text :description
      t.integer :creator_id

      t.timestamps
    end

    add_foreign_key :explorations, :users, column: "creator_id"
    add_index :explorations, :creator_id
  end
end
