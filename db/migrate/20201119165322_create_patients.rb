class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :doctor_id
      t.string :image

      t.timestamps
    end
  end
end
