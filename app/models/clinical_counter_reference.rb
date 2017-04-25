class ClinicalCounterReference < ApplicationRecord
  belongs_to :clinical_reference
  has_many :references_diagnostics, as: :referencer
  has_one :patient, through: :clinical_reference
  accepts_nested_attributes_for :references_diagnostics, allow_destroy: false
end
