class ChangeDesiredAgeToBeIntegerInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :desired_age, :integer, using: 'desired_age::integer'
  end
end
