class PatientSerializer < ApplicationSerializer
    attributes :id, :email, :name, :patient_meds, :tests, :doctor, :conversation_id, :image, :appointments, :age, :weight, :height, :gender

    def patient_meds
        ActiveModel::SerializableResource.new(object.patient_meds,  each_serializer: PatientMedSerializer)
    end

    def tests
        ActiveModel::SerializableResource.new(object.tests,  each_serializer: TestSerializer)
    end

    def appointments
        ActiveModel::SerializableResource.new(object.appointments, each_serializer: AppointmentSerializer)
    end

    def conversation_id
        self.object.conversation.id
    end

    def doctor
        {name: self.object.doctor.name, email: self.object.doctor.email, id: self.object.doctor.id}
    end
end