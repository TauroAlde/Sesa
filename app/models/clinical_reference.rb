class ClinicalReference < ApplicationRecord
  belongs_to :specialty
  belongs_to :parent_clinic, class_name: "Clinic", foreign_key: :parent_clinic_id
  belongs_to :destination_clinic, class_name: "Clinic", foreign_key: :destination_clinic_id
  belongs_to :patient
  has_many :references_diagnostics, as: :referencer, dependent: :destroy
  has_many  :diagnostics, through: :references_diagnostics

  accepts_nested_attributes_for :references_diagnostics, allow_destroy: false

  has_one :clinical_counter_reference, dependent: :destroy

  enum medical_query: [:urgencia, :consulta_exterior] # Urgencia o Concult. Ext.
end
