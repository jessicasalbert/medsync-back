class Api::V1::DoctorsController < ApplicationController
    #skip_before_action :authorized
    
    def profile
        render json: { user: current_user }, status: :accepted
    end

    def show
        doctor = Doctor.find(params[:id])
        render json: doctor, include: :patients
    end

    def availableAppointments
        doctor = Doctor.find(params[:id])
        date = Date.parse(params[:date]).strftime('%Y-%m-%d')
        specified_date = doctor.appointments.filter{ |appt| appt.date.strftime('%Y-%m-%d') == date }
        puts specified_date.class
        puts "hello"
        taken = specified_date.map{ |appt| appt.time_slot }
        avail = (1..5).filter{ |slot| !taken.include?(slot) }

        render json: avail
    end
    
end