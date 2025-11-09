class CreateRooms < ActiveRecord::Migration[7.2]
  def change
    create_table :rooms do |t|
      t.string :room_img
      t.string :name
      t.string :introduction
      t.string :address
      t.integer :Payment_amount

      t.timestamps
    end
  end
end