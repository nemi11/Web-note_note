# app/models/note.rb
class Note < ApplicationRecord
  # -----------------------------
  # 配列カラムをJSONで保存
  # -----------------------------
  serialize :tags, Array, coder: JSON
  serialize :extra_english, Array, coder: JSON
  serialize :extra_translation, Array, coder: JSON
  serialize :explanations, Array, coder: JSON
  serialize :divider, Array, coder: JSON

  # -----------------------------
  # 関連
  # -----------------------------
  belongs_to :user
  has_many :sections, inverse_of: :note
  accepts_nested_attributes_for :sections, allow_destroy: true

  # -----------------------------
  # バリデーション
  # -----------------------------
  validates :title, :tags, presence: true

  # -----------------------------
  # 検索メソッド
  # -----------------------------
def self.search(query)
  return all if query.blank?

  keywords = query.split.map(&:strip).reject(&:blank?)
  return all if keywords.empty?

  conditions = []
  values = []

  keywords.each do |kw|
    conditions << <<~SQL.squish
      (
        title ILIKE ? OR
        tags::jsonb @> ? OR
        extra_english::jsonb @> ? OR
        extra_translation::jsonb @> ?
      )
    SQL
    values += ["%#{kw}%", "[\"#{kw}\"]", "[\"#{kw}\"]", "[\"#{kw}\"]"]
  end

  where(conditions.join(" AND "), *values)
end
end
