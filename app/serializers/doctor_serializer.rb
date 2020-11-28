class DoctorSerializer < ApplicationSerializer
    attributes :id, :email, :name, :patients, :appointments

    def appointments
        ActiveModel::SerializableResource.new(object.appointments, each_serializer: AppointmentSerializer)
    end

    def patients
        ActiveModel::SerializableResource.new(object.patients,  each_serializer: PatientSerializer)
    end


    
end