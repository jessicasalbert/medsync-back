class Api::V1::ConditionsController < ApplicationController
    skip_before_action :authorized_patient, :authorized_doctor

    def create
        condition = Condition.create(condition_params)
        render json: condition
    end

    private

    def condition_params
        params.require(:condition).permit(:name, :test_id, :probability)
    end
end