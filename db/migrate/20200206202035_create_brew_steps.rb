class CreateBrewSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :brew_steps do |t|
      t.integer :status
      t.references :brew, null: false, foreign_key: true
      t.references :beer_step, null: false, foreign_key: true

      t.timestamps
    end
  end
end
