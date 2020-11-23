class Api::V1::MedsController < ApplicationController
    
    def index
        meds = Med.all
        render json: meds
    end
end