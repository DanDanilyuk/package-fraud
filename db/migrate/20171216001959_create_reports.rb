class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :name
      t.string :date
      t.string :carrier
      t.string :notes
      t.integer :code
      t.integer :price
      t.timestamps
    end
  end
end
