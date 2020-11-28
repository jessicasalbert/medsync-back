class AddFormattedDateToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :formatted_date, :string
  end
end
