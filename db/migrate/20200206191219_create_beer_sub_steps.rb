class CreateBeerSubSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :beer_sub_steps do |t|
      t.string :sub_step
      t.references :beer_step, null: false, foreign_key: true
      t.references :beer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
