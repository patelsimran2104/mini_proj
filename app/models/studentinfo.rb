class Studentinfo < ApplicationRecord

  belongs_to :student

  validates :name, presence: true
  validates_each :name do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  end
  validates :address, presence: true
  validates :phoneNo, presence: true
  validates :gender, presence: true  
  
  validate :validate_dob

  def validate_dob
    if dob.present? && dob > DateTime.now
        errors.add(:dob, 'dob cant be in future')
    end
  end
end
