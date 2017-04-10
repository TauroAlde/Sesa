class ClinicalCounterReference < ApplicationRecord
  belongs_to :clinical_reference

  has_one :patient, through: :clinical_reference
end
