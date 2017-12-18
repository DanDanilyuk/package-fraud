class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :orders_checked, default: 1
      t.integer :risk, default: 0
      t.timestamps
    end
  end
end
