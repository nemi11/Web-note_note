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

    # 複数キーワード対応
    keywords = query.split
    notes = self

    keywords.each do |word|
    notes = notes.where(
      "title LIKE :word OR content LIKE :word OR EXISTS (
        SELECT 1 FROM notes n
        WHERE n.id = notes.id AND JSON_EXTRACT(n.tags, '$') LIKE :word
      )",
      word: "%#{word}%"
    )
   end

    notes
  end
end
