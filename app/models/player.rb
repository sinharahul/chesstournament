class Player < ApplicationRecord
  validates :name, presence: true,
                      length: { minimum: 3 }
  validates :rating,numericality: true
end
