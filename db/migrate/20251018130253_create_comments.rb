class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :note, null: false, foreign_key: true
      t.integer :parent_id

      t.timestamps
    end
  end
end
