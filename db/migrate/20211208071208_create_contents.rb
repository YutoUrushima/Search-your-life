class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.references :life, foreign_key: true
      t.integer :year
      t.integer :month
      t.integer :date
      t.text :event

      t.timestamps
    end
  end
end
