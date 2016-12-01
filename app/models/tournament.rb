class Tournament < ApplicationRecord
  has_many :rounds,:dependent => :delete_all
end
