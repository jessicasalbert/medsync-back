class AppointmentSerializer < ApplicationSerializer
    attributes :id, :patient_id, :title, :details, :time_slot, :date, :start_date, :end_date
    
end