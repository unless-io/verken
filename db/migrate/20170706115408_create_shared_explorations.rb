class CreateSharedExplorations < ActiveRecord::Migration[5.0]
  def change
    create_table :shared_explorations do |t|
      t.references :user, foreign_key: true
      t.references :exploration, foreign_key: true

      t.timestamps
    end
  end
end
