class AddNameAndSurnameToPhysicians < ActiveRecord::Migration
  def change
    add_column :physicians, :name, :string, :null => false
    add_column :physicians, :surname, :string, :null => false
  end
end
