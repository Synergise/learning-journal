class CreateGlossariesLabels < ActiveRecord::Migration[6.0]
  def change
    create_table :glossaries_labels do |t|
      t.references :glossary, null: false, foreign_key: true
      t.references :label, null: false, foreign_key: true

      t.timestamps
    end
  end
end
