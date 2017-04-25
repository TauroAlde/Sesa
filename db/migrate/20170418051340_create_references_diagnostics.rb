class CreateReferencesDiagnostics < ActiveRecord::Migration[5.0]
  def change
    create_table :references_diagnostics do |t|
      t.string :referencer_type
      t.integer :referencer_id
      t.integer :diagnostic_id
      t.timestamps
    end
  end
end
