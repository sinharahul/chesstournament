class Round < ApplicationRecord
  belongs_to :tournament
  has_and_belongs_to_many :matches
end
