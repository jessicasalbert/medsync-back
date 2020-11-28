class Api::V1::AppointmentsController < ApplicationController

    def create
        timesHash = {
            "1" => { "start" => "T09:00", "end" => "T09:45" },
            "2" => { "start" => "T10:30", "end" => "T11:15" },
            "3" => { "start" => "T12:00", "end" => "T12:45" },
            "4" => { "start" => "T14:00", "end" => "T14:45" },
            "5" => { "start" => "T15:30", "end" => "T16:15" }
        }
        date = Date.parse(params[:date]).strftime('%Y-%m-%d')
        slot = params[:time_slot]
        #byebug
        appt = Appointment.create(
            doctor_id: params[:doctor_id],
            patient_id: params[:patient_id],
            title: params[:title],
            details: params[:details],
            time_slot: slot,
            date: date,
            start_date: date + timesHash[slot.to_s]["start"],
            end_date: date + timesHash[slot.to_s]["end"]
            )
        render json: appt
    end


    private

    def appt_params
        params.require(:appointment).permit!
    end
    
end