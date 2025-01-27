class AddLowStockLevelToProduct < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :low_stock_level, :integer, default: 0, null: false
  end
end
