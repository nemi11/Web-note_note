# app/models/note.rb
class Note < ApplicationRecord
  has_many :sections, inverse_of: :note
  accepts_nested_attributes_for :sections, allow_destroy: true

  validates :title, :tags, presence: true
end

# app/models/section.rb
class Section < ApplicationRecord
  belongs_to :note

  validates :text, :translation, presence: true
end