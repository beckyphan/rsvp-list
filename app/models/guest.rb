class Guest < ApplicationRecord
  belongs_to :party
  validates :fname, prescence: true
  validates: :lname, prescence: true
end
