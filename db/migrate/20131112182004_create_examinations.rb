class CreateSymptomatologies < ActiveRecord::Migration
  def change
    create_table :symptomatologies, :as_relation_superclass => true do |t|
      t.string :type
      t.references :consultation, index: true

      t.timestamps
    end
  end
end
