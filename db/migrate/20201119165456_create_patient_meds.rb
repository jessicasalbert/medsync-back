class CreatePatientMeds < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_meds do |t|
      t.string :dosage
      t.string :time
      t.string :notes
      t.integer :patient_id
      t.integer :med_id
      t.integer :pill_count
      t.boolean :has_taken

      t.timestamps
    end
  end
end
