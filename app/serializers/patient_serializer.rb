class PatientSerializer < ApplicationSerializer
    attributes :id, :email, :name, :patient_meds, :doctor, :conversation_id

    def patient_meds
        ActiveModel::SerializableResource.new(object.patient_meds,  each_serializer: PatientMedSerializer)
    end


    def conversation_id
        self.object.conversation.id
    end

    def doctor
        {name: self.object.doctor.name, email: self.object.doctor.email, id: self.object.doctor.id}
    end
end