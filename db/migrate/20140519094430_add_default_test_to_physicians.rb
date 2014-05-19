class AddDefaultTestToPhysicians < ActiveRecord::Migration
  def change
    add_column :physicians, :default_test, :string
  end
end
