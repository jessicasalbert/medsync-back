class Api::V1::ConversationsController < ApplicationController

    def show
        convo = Conversation.find(params[:id])
        render json: convo
    end
    
end