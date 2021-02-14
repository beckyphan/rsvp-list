class AddAssociationToGuest < ActiveRecord::Migration[6.1]
  def change
    add_reference :guests, :party, null: false, foreign_key: true
  end
end
