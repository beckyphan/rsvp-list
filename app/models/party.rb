class Party < ApplicationRecord
  validates :name, presence: true
  validate :unique_party, on: [:create, :update]
  has_many :guests, dependent: :destroy

  def unique_party
    if Party.where(name: name).size > 0 && !hoh.present?
      errors.add(:hoh, "additional unique identifier needed")
    elsif Party.where(name: name, hoh: hoh).size > 0
      errors.add(:hoh, "already exits. please create a unique identifier")
    end
  end
end
