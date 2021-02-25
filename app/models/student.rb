class Student < ApplicationRecord
  has_secure_password

  has_one :studentinfo
  has_one :result

  validates :email, presence: true, uniqueness: true
end
