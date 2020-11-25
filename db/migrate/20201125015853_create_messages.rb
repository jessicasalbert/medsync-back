class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :conversation_id
      t.string :sender_type
      t.string :content

      t.timestamps
    end
  end
end
