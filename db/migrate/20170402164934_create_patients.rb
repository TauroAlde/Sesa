class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :first_name 
      t.string :father_last_name 
      t.string :mother_last_name

      t.integer :age
      t.integer :phone, limit: 8
      t.integer :popular_insurance_id, limit: 8

      t.integer :gender             # enumerable

      t.timestamps
    end
  end
end
