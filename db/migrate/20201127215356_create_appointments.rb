class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.integer :doctor_id
      t.integer :patient_id
      t.string :start_date
      t.string :end_date
      t.string :details
      t.string :title
      t.integer :time_slot
      t.date :date

      t.timestamps
    end
  end
end
