class Match < ApplicationRecord
  has_and_belongs_to_many :players
  has_and_belongs_to_many :rounds
end
