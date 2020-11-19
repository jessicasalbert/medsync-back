class Api::V1::DoctorsController < ApplicationController
    
    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end
end