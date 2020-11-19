class Api::V1::PatientsController < ApplicationController

    def profile
        render json: { user: current_user }, status: :accepted
    end
end