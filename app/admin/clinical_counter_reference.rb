ActiveAdmin.register ClinicalCounterReference do
  belongs_to :clinical_reference, collection_name: :clinical_counter_reference

  permit_params :clinical_reference_id, :description, :completed_date

  controller do
    def scoped_collection # this prevents the bug with the relationship
      ClinicalCounterReference.where(clinical_reference_id: params[:clinical_reference_id])
    end

    def update
      update! do |format|
        format.html { redirect_to collection_path } if resource.valid?
      end
    end

    def create
      create! do |format|
        format.html { redirect_to collection_path } if resource.valid?
      end
    end
  end
  
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

  form do |f|
    f.inputs do
      f.input :clinical_reference_id, as: :hidden
      f.input :description
      f.input :completed_date, as: :date_time_picker, datepicker_options: { setLocale: "es" }
    end
    f.actions
  end

end
