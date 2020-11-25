class Api::V1::MessagesController < ApplicationController

    def create
        convo = Conversation.where(patient_id: params[:patient_id], doctor_id: params[:doctor_id])[0]
        message = Message.create(conversation_id: convo.id, content: params[:content], sender_type: params[:sender_type])
        render json: message
    end

    private


    def msg_params
        params.require(:message).permit(:patient_id, :doctor_id, :content, :sender_type)
    end
end