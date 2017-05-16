class AddScoreToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :score, :float, default: 0
  end
end
