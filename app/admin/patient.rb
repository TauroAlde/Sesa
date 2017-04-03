ActiveAdmin.register Patient do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :age, :phone, :popular_insurance_id, :medical_query,
    :gender, :transportation, :home_visit, :specialty_id, :diagnosis_id,
    :clinic_id, :counter_reference_id, :reference_date

  form do |f|
    f.inputs do
      f.input :folio
      f.inputs do
        f.input :parent_clinic, label: "Unidad que refiere" # referal clinic
      end

      f.input :name
      f.input :age
      f.input :gender
      f.input :popular_insurance_id, label: "Numero de Seguro Popular"
      f.input :phone

      f.input :medical_query
      f.input :diagnosis
      f.input :transportation
      f.input :specialty
      f.input :home_visit

      f.inputs do
        f.input :destination_clinic, label: "Unidad a la que se refiere" # reference clinic
      end

      f.input :counter_reference
    end
    f.actions
  end

end
