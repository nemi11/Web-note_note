class AddExplanationToNotes < ActiveRecord::Migration[7.1]
  def change
    add_column :notes, :explanation, :string
  end
end
