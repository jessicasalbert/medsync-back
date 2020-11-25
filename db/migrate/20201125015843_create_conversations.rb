class CreateConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :conversations do |t|
      t.integer :doctor_id
      t.integer :patient_id

      t.timestamps
    end
  end
end
