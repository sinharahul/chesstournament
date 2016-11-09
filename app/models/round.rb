class Round < ApplicationRecord
  belongs_to :tournament
  has_one :match
end
