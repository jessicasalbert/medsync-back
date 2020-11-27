class Patient < ApplicationRecord
    has_many :patient_meds
    has_many :meds, through: :patient_meds
    belongs_to :doctor
    has_one :conversation
    has_many :appointments
    has_secure_password
end
