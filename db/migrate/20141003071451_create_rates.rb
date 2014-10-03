class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :rate
      t.references :user, index: true
      t.references :book, index: true

      t.timestamps
    end
  end
end
