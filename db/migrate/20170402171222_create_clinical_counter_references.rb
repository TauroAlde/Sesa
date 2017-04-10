class CreateClinicalCounterReferences < ActiveRecord::Migration[5.0]
  def change
    create_table :clinical_counter_references do |t|
      t.text :description
      t.datetime :completed_date

      t.integer :clinical_reference_id

      t.timestamps
    end
  end
end
