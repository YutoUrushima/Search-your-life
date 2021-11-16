class CreateLives < ActiveRecord::Migration[5.0]
  def change
    create_table :lives do |t|
      t.string :name
      t.integer :year
      t.integer :month
      t.integer :date
      t.text :introduce
      t.string :image

      t.timestamps
    end
  end
end
