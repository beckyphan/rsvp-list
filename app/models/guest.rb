class Guest < ApplicationRecord
  belongs_to :party
  validates :fname, presence: true
  validates :lname, presence: true
  before_save :downcase

  def downcase
    self.fname.downcase!
    self.lname.downcase!
  end
end
