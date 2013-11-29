class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|


      t.integer :category, index: true
      t.string :score


      t.references :test_data, polymorphic: true

      t.belongs_to :consultation, index: true



      t.timestamps
    end
  end
end
