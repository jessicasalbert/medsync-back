class TestSerializer < ApplicationSerializer
    attributes :patient_id, :created_at, :conditions, :answers, :id

    def created_at
        self.object.created_at.in_time_zone("Eastern Time (US & Canada)").to_date
    end
    
    def conditions
        ActiveModel::SerializableResource.new(object.conditions,  each_serializer: ConditionSerializer)
    end

    def answers
        ActiveModel::SerializableResource.new(object.answers,  each_serializer: AnswerSerializer)
    end

end