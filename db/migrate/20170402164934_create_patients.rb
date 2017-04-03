class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :folio
      t.integer :age
      t.integer :phone
      t.integer :popular_insurance_id
     
      t.integer :medical_query      # enumerable
      t.integer :gender             # enumerable
      t.integer :diagnosis          # enumerable
      t.integer :counter_reference  # enumerable
      t.datetime :counter_reference_date # datetime field

      t.boolean :transportation, default: false # boolean - if the transportation was provided
      t.boolean :home_visit,     default: false # boolean - if the patient was visited at home
      
      t.integer :specialty_id           # relation
      t.integer :parent_clinic_id       # relation
      t.integer :destination_clinic_id  # relation
      

      t.datetime :reference_date # date in which the patient was referenced to the clinic

      t.timestamps
    end
  end
end
