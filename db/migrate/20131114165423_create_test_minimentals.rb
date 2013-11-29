class CreateTestMinimentals < ActiveRecord::Migration
  def change
    create_table :test_minimentals do |t|
      t.integer :year
      t.integer :station
      t.integer :day_month
      t.integer :day_week
      t.integer :month
      t.integer :country
      t.integer :province
      t.integer :city
      t.integer :where
      t.integer :flat
      t.integer :objects
      t.integer :attention
      t.integer :memory
      t.integer :pencil
      t.integer :repeat
      t.integer :orders
      t.integer :eyes
      t.integer :sentence
      t.integer :draw


      t.belongs_to :consultation, index: true

      t.timestamps
    end
  end
end
