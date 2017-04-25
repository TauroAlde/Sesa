class ReferencesDiagnostic < ApplicationRecord
  belongs_to :referencer, polymorphic: true
  belongs_to :diagnostic
end
