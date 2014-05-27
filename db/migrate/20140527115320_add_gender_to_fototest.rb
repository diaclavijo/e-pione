class AddGenderToFototest < ActiveRecord::Migration
  def change
    add_column :fototests, :gender, :integer
  end
end
