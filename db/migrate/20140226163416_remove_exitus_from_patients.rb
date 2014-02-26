class RemoveExitusFromPatients < ActiveRecord::Migration
  def change
    remove_column :patients, :exitus, :boolean
  end
end
