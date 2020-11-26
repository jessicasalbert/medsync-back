class DoctorSerializer < ApplicationSerializer
    attributes :id, :email, :name, :patients

    def patients
        ActiveModel::SerializableResource.new(object.patients,  each_serializer: PatientSerializer)
    end


    
end