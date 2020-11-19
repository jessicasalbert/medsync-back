class PatientMed < ApplicationRecord
    belongs_to :med
    belongs_to :patient
end
