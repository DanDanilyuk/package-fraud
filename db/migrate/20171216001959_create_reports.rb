class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :name
      t.string :date
      t.string :carrier
      t.string :notes
      t.integer :code
      t.float :price, :precision => 8, :scale => 2
      t.integer :address_id
      t.timestamps
    end
  end
end
