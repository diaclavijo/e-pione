class CreateFototest < ActiveRecord::Migration
  def change
    create_table :fototests do |t|
      t.belongs_to :physician, index: true
      t.integer :diagnosis
      t.float :probability
      t.float :age
      t.integer :correct
      t.integer :education
      t.integer :cartas1
      t.integer :coche1
      t.integer :pera1
      t.integer :trompeta1
      t.integer :zapatos1
      t.integer :cuchara1
      t.integer :cartas2
      t.integer :coche2
      t.integer :pera2
      t.integer :trompeta2
      t.integer :zapatos2
      t.integer :cuchara2
      t.integer :cartas3
      t.integer :coche3
      t.integer :pera3
      t.integer :trompeta3
      t.integer :zapatos3
      t.integer :cuchara3
      t.integer :total_hombres
      t.integer :total_mujeres

      t.timestamps
    end
  end
end
