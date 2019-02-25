class ChangeDesiredAgeToBeIntegerInPersonalities < ActiveRecord::Migration[5.2]
  def change
      change_column :personalities, :desired_age, :integer, using: 'desired_age::integer'
  end
end
