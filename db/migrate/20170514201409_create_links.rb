class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.references :item, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
