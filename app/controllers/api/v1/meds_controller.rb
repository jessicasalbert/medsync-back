class Api::V1::MedsController < ApplicationController
    
    def index
        meds = Med.all.order(:name)
        render json: meds
    end
end