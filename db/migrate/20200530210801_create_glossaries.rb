class CreateGlossaries < ActiveRecord::Migration[6.0]
  def change
    create_table :glossaries do |t|
      t.string :term,     null: false
      t.text :definition, null: false

      t.timestamps
    end
  end
end
