class PatientSerializer < ApplicationSerializer
    attributes :id, :email, :name, :patient_meds

    def patient_meds
        ActiveModel::SerializableResource.new(object.patient_meds,  each_serializer: PatientMedSerializer)
    end
end