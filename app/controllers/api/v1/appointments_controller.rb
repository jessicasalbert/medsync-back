class Api::V1::AppointmentsController < ApplicationController

    def create
        timesHash = {
            "1" => { "start" => "09:00", "end" => "09:45" },
            "2" => { "start" => "10:30", "end" => "11:15" },
            "3" => { "start" => "12:00", "end" => "12:45" },
            "4" => { "start" => "14:00", "end" => "14:45" },
            "5" => { "start" => "15:30", "end" => "16:15" }
        }
        date = Date.parse(params[:date]).strftime('%Y-%m-%d')
        slot = params[:time_slot]
        def format_time(time)
            time.to_s.sub(/^(\d{1,2})(\d{2})$/,'\1:\2')
        end
        #byebug
        appt = Appointment.create(
            doctor_id: params[:doctor_id],
            patient_id: params[:patient_id],
            title: params[:title],
            details: params[:details],
            time_slot: slot,
            date: date,
            start_date: date + "T" + timesHash[slot.to_s]["start"],
            end_date: date + "T" + timesHash[slot.to_s]["end"],
            formatted_date: Date.parse(date).strftime("%a, %d %b %Y"),
            formatted_time: "#{timesHash[slot.to_s]['start']} - #{timesHash[slot.to_s]['end']}"
            )
        render json: appt
    end

    def destroy
        apt = Appointment.find(params[:id])
        apt.delete
        render json: apt
    end


    private

    def appt_params
        params.require(:appointment).permit!
    end
    
end