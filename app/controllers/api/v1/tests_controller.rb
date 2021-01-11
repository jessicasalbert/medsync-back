class Api::V1::TestsController < ApplicationController
    skip_before_action :authorized_doctor

    def create
        test = Test.create(test_params)
        render json: test
    end

    private

    def test_params
        params.require(:test).permit(:patient_id)
    end
end