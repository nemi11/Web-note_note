# app/models/note.rb
class Note < ApplicationRecord
  serialize :tags, Array, coder: JSON
  serialize :extra_english, Array, coder: JSON
  serialize :extra_translation, Array, coder: JSON
  serialize :explanations, Array, coder: JSON
  serialize :divider, Array, coder: JSON

  has_many :sections, inverse_of: :note
  accepts_nested_attributes_for :sections, allow_destroy: true

  validates :title, :tags, presence: true

  belongs_to :user
end
