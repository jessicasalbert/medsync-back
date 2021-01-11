class Api::V1::MedsController < ApplicationController
    skip_before_action :authorized_patient
    
    def index
        meds = Med.all.order(:name)
        render json: meds
    end
end