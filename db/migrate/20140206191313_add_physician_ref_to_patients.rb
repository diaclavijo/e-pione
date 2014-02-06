class AddPhysicianRefToPatients < ActiveRecord::Migration
  def change
    add_reference :patients, :physician, index: true
  end
end
