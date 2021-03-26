class Result < ApplicationRecord
    belongs_to :student

    validates :subjects, presence: true
    validates :gread, presence: true
end
