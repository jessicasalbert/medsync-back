class Api::V1::PatientsController < ApplicationController
    skip_before_action :authorized_patient, only [:show]
    skip_before_action :authorized_doctor, only [:profile]

    def profile
        render json: { user: current_user }, status: :accepted
    end

    def show 
        @patient = Patient.find(params[:id])
        render json: @patient, serializer: PatientSerializer
    end
end