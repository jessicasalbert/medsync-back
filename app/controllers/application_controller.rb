

class ApplicationController < ActionController::API
    before_action :authorized_patient, :authorized_doctor
   
    def encode_token(payload)
      # should store secret in env variable
      JWT.encode(payload, 'my_s3cr3t')
    end
   
    def auth_header
      # { Authorization: 'Bearer <token>' }
      request.headers['Authorization']
    end
   
    def decoded_token
      if auth_header
        token = auth_header.split(' ')[1]
        # header: { 'Authorization': 'Bearer <token>' }
        begin
          JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
        rescue JWT::DecodeError
          nil
        end
      end
    end
   
    def current_doctor
        if decoded_token
          user_id = decoded_token[0]['user_id']
          @user = Doctor.find_by(id: user_id)
          return @user
        end
    end

    def current_patient
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = Patient.find_by(id: user_id)
            return @user
        end
    end
   
    def logged_in_patient?
      !!current_patient
    end

    def logged_in_doctor?
      !!current_doctor
    end
   
    def authorized_patient
      render json: { message: 'Please log in' }, status: :unauthorized unless logged_in_patient?
    end

    def authorized_doctor
      render json: { message: 'Please log in' }, status: :unauthorized unless logged_in_doctor?
    end
  end