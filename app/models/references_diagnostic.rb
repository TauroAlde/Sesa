class ReferencesDiagnostic < ApplicationRecord
  belongs_to :referencer, polymorphic: true
  belongs_to :diagnostic
  belongs_to :clinical_counter_reference
  belongs_to :clinical_reference
end
