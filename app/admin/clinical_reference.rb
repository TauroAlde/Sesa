ActiveAdmin.register ClinicalReference do
  belongs_to :patient
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  controller do
    def create
      super do |format|
        redirect_to admin_patient_path(resource.patient) and return if resource.valid?
      end
    end
    
    def update
      super do |format|
        redirect_to admin_patient_clinical_reference_path(resource.patient, resource) and return if resource.valid?
      end
    end
  end

  permit_params :folio, :diagnosis, :medical_query, :transportation, :clinical_reference_date,
                :home_visit, :patient_id, :specialty_id, :parent_clinic_id,  :destination_clinic
  form do |f|   
    f.inputs do
      f.input :folio
      f.input :diagnosis
      f.input :medical_query # enumera
      
      f.input :transportation
      f.input :home_visit
      
      f.input :patient_id, as: :hidden
      f.input :specialty
      f.input :parent_clinic
      f.input :destination_clinic
      f.input :clinical_reference_date, as: :date_time_picker, datepicker_options: { setLocale: "es" }
    end
    f.actions
  end

  show do
    attributes_table do
      row :folio
      row :diagnosis
      row :medical_query
      row :transportation
      row :home_visit
    end

    if clinical_reference.clinical_counter_reference
      panel "Contra Referencia" do
        attributes_table_for clinical_reference.clinical_counter_reference do
          row :description
          row :completed_date
        end
      end
    else
      panel "Acciones" do
        span link_to "Hacer Contra Referencia", new_admin_clinical_reference_clinical_counter_reference_path(clinical_reference)
      end
    end
  end

end
