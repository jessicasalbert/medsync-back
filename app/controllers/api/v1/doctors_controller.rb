class Api::V1::DoctorsController < ApplicationController
    
    def profile
        render json: { user: current_user }, status: :accepted
    end

    def show
        doctor = Doctor.find(params[:id])
        render json: doctor, include: :patients
    end
    
end