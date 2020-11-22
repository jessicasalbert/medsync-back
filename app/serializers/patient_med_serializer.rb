class PatientMedSerializer < ApplicationSerializer
    attributes :id, :med, :notes, :dosage, :time, :pill_count, :has_taken

    def med
        ActiveModel::SerializableResource.new(object.med,  serializer: MedSerializer)
    end


end