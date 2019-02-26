class AddPricePerDayToPersonalities < ActiveRecord::Migration[5.2]
  def change
    add_column :personalities, :price_per_day, :integer
  end
end
