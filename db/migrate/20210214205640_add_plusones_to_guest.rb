class AddPlusonesToGuest < ActiveRecord::Migration[6.1]
  def change
    add_column :guests, :plusones, :integer, :default => 0
  end
end
