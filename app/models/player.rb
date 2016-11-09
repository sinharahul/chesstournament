class Player < ApplicationRecord
  has_and_belongs_to_many :matches
  validates :name, presence: true,
                      length: { minimum: 3 }
  validates :rating,numericality: true
end
