class ClinicalCounterReference < ApplicationRecord
  has_many :references_diagnostics, as: :referencer, dependent: :destroy
  has_many  :diagnostics, through: :references_diagnostics
  has_one :patient, through: :clinical_reference
  belongs_to :clinical_reference
  accepts_nested_attributes_for :references_diagnostics, allow_destroy: false
end
