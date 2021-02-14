class Party < ApplicationRecord
  validates :name, presence: true
  validate :unique_party, on: :create
  has_many :guests

  def unique_party
    if Party.select(:name).size > 1 && !hoh.present?
      errors.add(:hoh, "additional unique identifier needed")
    end
  end
end
