class Patient < ApplicationRecord
    has_many :patient_meds
    has_many :meds, through: :patient_meds
    belongs_to :doctor
end
