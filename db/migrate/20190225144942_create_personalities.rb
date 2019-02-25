class CreatePersonalities < ActiveRecord::Migration[5.2]
  def change
    create_table :personalities do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.references :user, foreign_key: true
      t.string :desired_gender
      t.string :desired_age
      t.string :picture

      t.timestamps
    end
  end
end
