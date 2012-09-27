class CreateQuotations < ActiveRecord::Migration
  def change
    create_table :quotations do |t|
      t.text :quote
      t.text :description

      t.references :person

      t.timestamps
    end
  end
end
