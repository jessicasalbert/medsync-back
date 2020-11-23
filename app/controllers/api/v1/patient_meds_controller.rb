class Api::V1::PatientMedsController < ApplicationController
    # skip_before_action :authorized

   
    def update 
        @pt_med = PatientMed.find(params[:id])
        @pt_med.update(pt_meds_params)
        #byebug
        render json: @pt_med
    end

    def destroy
        med = PatientMed.find(params[:id])
        med.destroy
        render json: med
    end

    def create
        med = PatientMed.create(pt_meds_params)
        render json: med, serializer: PatientMedSerializer
    end

    private

    def pt_meds_params
        params.require(:patient_med).permit(:patient_id, :med_id, :time, :notes, :pill_count, :has_taken)
    end
end
