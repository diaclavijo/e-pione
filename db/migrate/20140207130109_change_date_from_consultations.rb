class ChangeDateFromConsultations < ActiveRecord::Migration
  def change
    remove_column :consultations, :date, :date
    add_column    :consultations, :date, :datetime
  end
end
