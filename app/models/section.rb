# app/models/section.rb
class Section < ApplicationRecord
  belongs_to :note

  validates :text, :translation, presence: true
end