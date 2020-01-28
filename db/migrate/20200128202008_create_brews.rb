class CreateBrews < ActiveRecord::Migration[6.0]
  def change
    create_table :brews do |t|

      t.timestamps
    end
  end
end
