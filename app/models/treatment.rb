class Treatment < ApplicationRecord
  belongs_to :appointment

  validates :name, presence: true
  validates :administered_at, presence: true
  validates :appointment, presence: true
  has_rich_text :clinical_notes
end