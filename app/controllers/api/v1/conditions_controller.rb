class Api::V1::ConditionsController < ApplicationController
    
    def create
        condition = Condition.create(condition_params)
        render json: condition
    end

    private

    def condition_params
        params.require(:condition).permit(:name, :test_id, :probability)
    end
end