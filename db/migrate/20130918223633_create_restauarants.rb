class CreateRestauarants < ActiveRecord::Migration
  def change
    create_table :restauarants do |t|
      t.string :name
      t.string :address
      t.string :image
      t.string :website
      t.integer :phone_number
      t.integer :owner_id

      t.timestamps
    end
  end
end
