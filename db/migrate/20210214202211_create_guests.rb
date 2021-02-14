class CreateGuests < ActiveRecord::Migration[6.1]
  def change
    create_table :guests do |t|
      t.string :fname
      t.string :lname
      t.boolean :attending
      t.boolean :shuttle
      t.boolean :hotel
      t.string :notes

      t.timestamps
    end
  end
end
