class CreateClinicalReferences < ActiveRecord::Migration[5.0]
  def change
    create_table :clinical_references do |t|
      t.string  :folio
      t.string  :diagnostic
      t.integer :medical_query # enumerable

      t.boolean :transportation, default: false # boolean - if the transportation was provided
      t.boolean :home_visit,     default: false # boolean - if the patient was visited at home
     
      t.integer :patient_id             # relation
      t.integer :specialty_id           # relation
      t.integer :parent_clinic_id       # relation
      t.integer :destination_clinic_id  # relation

      t.datetime :clinical_reference_date # date in which the patient was referenced to the clinic
      
      t.timestamps
    end
  end
end
