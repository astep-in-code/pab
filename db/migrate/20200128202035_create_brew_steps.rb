class CreateBrewSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :brew_steps do |t|
      t.string :status
      t.references :brew_id, null: false, foreign_key: true
      t.references :beer_step_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
