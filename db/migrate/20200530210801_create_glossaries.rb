class CreateGlossaries < ActiveRecord::Migration[6.0]
  def change
    create_table :glossaries do |t|
      t.string :term
      t.text :description

      t.timestamps
    end
  end
end
