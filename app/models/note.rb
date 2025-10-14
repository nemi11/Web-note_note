# app/models/note.rb
class Note < ApplicationRecord
  serialize :tags, Array, coder: JSON

  has_many :sections, inverse_of: :note
  accepts_nested_attributes_for :sections, allow_destroy: true

  validates :title, :tags, presence: true
end
