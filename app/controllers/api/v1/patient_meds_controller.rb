class Api::V1::PatientMedsController < ApplicationController
    # skip_before_action :authorized

   
    def update 
        @pt_med = PatientMed.find(params[:id])
        @pt_med.update(pt_meds_params)
        render json: @pt_med
    end

    def destroy
    med = PatientMed.find(params[:id])
        med.destroy
        render json: med
    end

    private

    def pt_meds_params
        params.permit(:time, :notes, :pill_count)
    end
end
