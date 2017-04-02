class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :age
      t.integer :phone
      t.integer :popular_insurance_id
     
      t.integer :medical_query  # enumerable
      t.integer :gender         # enumerable

      t.boolean :transportation, default: false # boolean - if the transportation was provided
      t.boolean :home_visit,     default: false    # boolean - if the patient was visited at home
      
      t.integer :specialty_id         # relation
      t.integer :diagnosis_id         # relation
      t.integer :clinic_id            # relation
      t.integer :counter_reference_id # relation

      t.datetime :reference_date # date in which the patient was referenced to the clinic
      

      t.timestamps
    end
  end
end
