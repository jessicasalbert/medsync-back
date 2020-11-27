class Doctor < ApplicationRecord
    has_many :patients
    has_many :conversations
    has_many :appointments
    has_secure_password


end
