class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]
   
    def create
      @doctor = Doctor.find_by(username: doctor_login_params[:email])
      #User#authenticate comes from BCrypt
      if @doctor && @doctor.authenticate(doctor_login_params[:password])
        # encode token comes from ApplicationController
        token = encode_token({ doctor_id: @doctor.id })
        render json: { user: @doctor, jwt: token, user_type: "doctor" }, status: :accepted
      else
        render json: { message: 'Invalid username or password' }, status: :unauthorized
      end
    end
   
    private
   
    def user_login_params
      # params { user: {username: 'Chandler Bing', password: 'hi' } }
      params.require(:user).permit(:email, :password)
    end
  end