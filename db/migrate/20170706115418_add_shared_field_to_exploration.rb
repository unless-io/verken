class AddSharedFieldToExploration < ActiveRecord::Migration[5.0]
  def change
    add_column :explorations, :shared, :boolean, default: false
  end
end
