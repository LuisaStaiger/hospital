class Doctor < ApplicationRecord
  has_many :appointments
  has_many :educations, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :title, inclusion: ['Prof', 'Dr']
  validates :speciality, inclusion: ['Dermatologist', 'Pneumologist', 'Cardiologist', 'Dentist', 'GP']
  validates :experience, inclusion: { in: 2..6 }
end
