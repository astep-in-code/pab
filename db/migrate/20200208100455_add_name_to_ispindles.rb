class AddNameToIspindles < ActiveRecord::Migration[6.0]
  def change
    add_column :ispindles, :name, :string
    add_reference :ispindles, :brew, foreign_key: true
    remove_reference :brews, :ispindle, foreign_key: true
  end
end
