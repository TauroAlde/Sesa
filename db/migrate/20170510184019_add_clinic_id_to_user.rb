class AddClinicIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :clinic_id, :integer
  end
end
