class AddScoreToTestFaqs < ActiveRecord::Migration
  def change
    add_column :test_faqs, :score, :integer
  end
end
