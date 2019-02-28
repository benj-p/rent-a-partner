class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :content
      t.boolean :read, :default => false
      t.bigint :sender_id
      t.bigint :recipient_id
      t.references :booking, foreign_key: true

      t.timestamps
    end

    add_foreign_key :messages, :users, column: :sender_id
    add_foreign_key :messages, :users, column: :recipient_id
  end
end
