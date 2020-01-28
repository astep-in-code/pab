class CreateBrewSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :brew_steps do |t|

      t.timestamps
    end
  end
end
