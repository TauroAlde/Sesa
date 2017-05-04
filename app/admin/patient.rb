ActiveAdmin.register Patient do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :first_name, :father_last_name, :mother_last_name, :age, :phone,
                :popular_insurance_id, :gender,
                clinical_references_attributes:
                  [
                    :id, :folio, :diagnostic, :medical_query, :transportation,
                    :home_visit, :specialty_id, :parent_clinic_id, :destination_clinic_id,
                    :clinical_reference_date
                  ]

  action_item :new_reference, only: :show do
    link_to "Nueva Referencia", new_admin_patient_clinical_reference_path(patient)
  end

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
        f.object.clinical_references.build if f.object.new_record?  # show a default reference

        f.has_many :clinical_references, heading: "Referencia", new_record: false, allow_destroy: false do |d|
          d.input :folio
          d.object.references_diagnostics.build if f.object.new_record?
          d.has_many :references_diagnostics do |h|
            h.input :diagnostic
          end
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
  show do
    attributes_table do
      row :first_name
      row :father_last_name
      row :mother_last_name
      row :age
      row :gender
      row :popular_insurance_id
      row :phone
    end

    table_for patient.clinical_references do
      column(:folio) do |clinical_reference|
        link_to clinical_reference.folio, admin_patient_clinical_reference_path(patient, clinical_reference)
      end
 
      column(:clinical_reference_date) { |clinical_reference| clinical_reference.clinical_reference_date }
 
      column(:counter_reference) do |clinical_reference|
        status_tag (clinical_reference.clinical_counter_reference ?  :ok : :no)
      end

      column(:completed_date) do |clinical_reference|
        if clinical_reference.clinical_counter_reference
          clinical_reference.clinical_counter_reference.completed_date
        else
          status_tag :no
        end
      end

      column(:actions) do |clinical_reference|
        if clinical_reference.clinical_counter_reference
          link_to "Ver detalles", admin_clinical_reference_clinical_counter_reference_path(patient)
        else
          link_to "Hacer contrarreferencia", new_admin_clinical_reference_clinical_counter_reference_path(clinical_reference)
        end
      end
    end
  end

  
  filter :clinical_references_folio_eq, label: "No. Folio"
  filter :first_name
  filter :father_last_name
  filter :mother_last_name
  filter :age
  filter :gender
  filter :popular_insurance_id
  filter :phone
  #sidebar "Referencia", only: :show do
  #  attributes_table_for patient do
  #    row :diagnosis
  #    row :destination_clinic
  #    row :clinical_reference_date
  #  end
  #end
  #sidebar "Contra Referencia", only: :show do
  #  attributes_table_for patient do
  #    row :description
  #    row :clinical_reference_id
  #    row :completed_date
  #  end
  #end
  #end de la referecnia y contrareferencia
end
