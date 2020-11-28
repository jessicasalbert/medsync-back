class AddFormattedTimeToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :formatted_time, :string
  end
end
