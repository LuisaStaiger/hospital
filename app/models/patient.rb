class Patient < ApplicationRecord
  has_many :doctors
  has_many :appointments
end
