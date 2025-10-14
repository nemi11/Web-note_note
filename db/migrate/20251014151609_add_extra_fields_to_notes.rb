class AddExtraFieldsToNotes < ActiveRecord::Migration[7.1]
  def change
    add_column :notes, :extra_english, :text
    add_column :notes, :extra_translation, :text
    add_column :notes, :explanations, :text
  end
end
