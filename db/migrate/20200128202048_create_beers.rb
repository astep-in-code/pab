class CreateBeers < ActiveRecord::Migration[6.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.integer :volume
      t.string :fermentation
      t.integer :initial_density_target
      t.integer :final_density_target
      t.integer :fermentation_temperature_target
      t.integer :color
      t.integer :bitterness
      t.integer :bitterness_ratio
      t.string :alcohol
      t.text :description
      t.text :recipe
      # t.references :beer_step, null: false, foreign_key: true

      t.timestamps
    end
  end
end
