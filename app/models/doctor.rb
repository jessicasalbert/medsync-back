class Doctor < ApplicationRecord
    has_many :patients
    has_secure_password

end
