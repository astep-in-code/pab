class CreateBeerSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :beer_steps do |t|
      t.string :sub_step
      t.string :step
      t.text :description

      t.timestamps
    end
  end
end
