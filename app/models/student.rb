class Student < ApplicationRecord
  has_secure_password

  has_one :studentinfo
  has_one :result

  validates :email, presence: true, uniqueness: true,
                            format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, message: "Email invalid"  },
                            length: { minimum: 4, maximum: 254 }

  
end
