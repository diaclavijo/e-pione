class AddScoreToTestRelojs < ActiveRecord::Migration
  def change
    add_column :test_relojs, :score, :integer
  end
end
