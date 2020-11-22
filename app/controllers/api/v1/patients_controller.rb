class Api::V1::PatientsController < ApplicationController
    # skip_before_action :authorized

    def profile
        render json: { user: current_user }, status: :accepted
    end

    def show 
        patient = Patient.find(params[:id])
        render json: patient, include: :meds
    end
end