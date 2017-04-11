class Patient < ApplicationRecord
  has_many :clinical_references
  has_many :clinical_counter_references, through: :clinical_references

  validates :popular_insurance_id, length: { maximum: 10 }
  validates :phone, length: { is: 10 }

  enum gender: [:masculino, :femenino]

  accepts_nested_attributes_for :clinical_references, allow_destroy: false
end
