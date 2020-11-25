class Doctor < ApplicationRecord
    has_many :patients
    has_many :conversations
    has_secure_password


end
