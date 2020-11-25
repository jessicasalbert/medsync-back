class ConversationSerializer < ApplicationSerializer
    attributes :patient_id, :doctor_id, :messages, :id

    def messages
        ActiveModel::SerializableResource.new(object.messages,  each_serializer: MessageSerializer)
    end


end