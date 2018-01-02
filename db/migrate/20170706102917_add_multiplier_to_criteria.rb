class AddMultiplierToCriteria < ActiveRecord::Migration[5.0]
  def change
    add_column :criteria, :multiplier, :float, default: 1
  end
end
