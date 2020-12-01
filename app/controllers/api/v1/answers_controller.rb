class Api::V1::AnswersController < ApplicationController
    
    def create
        answer = Answer.create(answer_params)
        render json: answer
    end

    private

    def answer_params
        params.require(:answer).permit(:symptom, :test_id, :response, :question)
    end
    
end