class AddMailToLifes < ActiveRecord::Migration[5.2]
  def change
    add_column :lives, :mail, :string
  end
end
