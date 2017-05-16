class CreateCriteria < ActiveRecord::Migration[5.0]
  def change
    create_table :criteria do |t|
      t.references :exploration, foreign_key: true
      t.string :title
      t.string :question_type

      t.timestamps
    end
  end
end
