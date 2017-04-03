ActiveAdmin.register Patient do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :age, :phone, :popular_insurance_id,
    :popular_insurance_id, :medical_query, :gender, :transportation,
    :home_visit, :specialty_id, :diagnosis_id, :clinic_id,
    :counter_reference_id, :reference_date
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
