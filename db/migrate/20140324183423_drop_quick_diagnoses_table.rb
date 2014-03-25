class DropQuickDiagnosesTable < ActiveRecord::Migration
	def up
		drop_table :quick_diagnoses
	end

	def down
		raise ActiveRecord::IrreversibleMigration
	end
end
