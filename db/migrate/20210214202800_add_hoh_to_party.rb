class AddHohToParty < ActiveRecord::Migration[6.1]
  def change
    add_column :parties, :hoh, :string
  end
end
