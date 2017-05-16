class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :exploration, foreign_key: true
      t.string :title
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
