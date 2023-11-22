class Education < ApplicationRecord
  belongs_to :doctor, dependent: :destroy
  validates :score, presence: true , inclusion: { in: 50..100 }
end

# - Score - has to be above 50 and below 100
