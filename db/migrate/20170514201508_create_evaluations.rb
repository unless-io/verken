class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.references :item, foreign_key: true
      t.references :criterium, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :rating
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
