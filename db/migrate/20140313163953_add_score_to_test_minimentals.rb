class AddScoreToTestMinimentals < ActiveRecord::Migration
  def change
    add_column :test_minimentals, :score, :integer
  end
end
