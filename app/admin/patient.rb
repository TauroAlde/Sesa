ActiveAdmin.register Patient do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :first_name, :father_last_name, :mother_last_name, :age, :phone,
                :popular_insurance_id, :gender

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :father_last_name
      f.input :mother_last_name

      f.input :age
      f.input :gender
      f.input :popular_insurance_id, label: "Numero de Seguro Popular"
      f.input :phone

      f.inputs do
        f.object.clinical_references.build # show a default reference

        f.has_many :clinical_references, heading: "Referencia", new_record: false, allow_destroy: false do |d|
          d.input :folio
          d.input :diagnosis
          d.input :medical_query # enumer
        
          d.input :transportation
          d.input :home_visit

          d.input :specialty
          d.input :parent_clinic, label: "Unidad refiere"
          d.input :destination_clinic, label: "Unidad a la que se refiere"

          d.input :clinical_reference_date, as: :date_time_picker, datepicker_options: { setLocale: "es" }
        end
      end
    end
    f.actions
  end
  #las referencias y contra referencias
  sidebar "Referencia", only: :show do
    attributes_table_for patient do
      row :diagnosis
      row :destination_clinic
      row :clinical_reference_date
    end
  end
  sidebar "Contra Referencia", only: :show do
    attributes_table_for patient do
      row :description
      row :clinical_reference_id
      row :completed_date
    end
  end
  #end de la referecnia y contrareferencia
end
