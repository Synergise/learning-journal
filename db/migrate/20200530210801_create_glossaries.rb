class CreateGlossaries < ActiveRecord::Migration[6.0]
  def change
    create_table :glossaries do |t|
      t.string :term,     null: false, default: ''
      t.text :definition, null: false, default: ''

      t.timestamps
    end
  end
end
