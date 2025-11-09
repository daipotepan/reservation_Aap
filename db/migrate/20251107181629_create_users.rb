class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :conf_password
      t.string :icon
      t.string :introduction
      
      t.timestamps
    end
  end
end
