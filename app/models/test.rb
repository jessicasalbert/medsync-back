class Test < ApplicationRecord
    has_many :conditions
    has_many :answers
    belongs_to :patient
end
