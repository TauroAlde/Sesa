class Patient < ApplicationRecord
  belongs_to :specialty
  belongs_to :parent_clinic, class_name: "Clinic", foreign_key: :parent_clinic_id
  belongs_to :destination_clinic, class_name: "Clinic", foreign_key: :destination_clinic_id

  enum medical_query: [:embarazo, :cesaria]
  enum gender: [:masculino, :femenino]
  enum diagnosis: [:urgencia, :consulta_exterior]
  enum counter_reference: [:sano, :enfermo]
end
