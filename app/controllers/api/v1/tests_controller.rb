class Api::V1::TestsController < ApplicationController
    
    def create
        test = Test.create(test_params)
        render json: test
    end

    private

    def test_params
        params.require(:test).permit(:patient_id)
    end
end