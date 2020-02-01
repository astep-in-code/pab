class CreateBeers < ActiveRecord::Migration[6.0]
  def change
    create_table :beers do |t|
      t.string :style
      t.integer :volume
      t.integer :fermentation
      t.integer :initial_density
      t.integer :final_density
      t.string :color
      t.integer :bitterness
      t.integer :bitterness_ratio
      t.string :alcohol
      t.text :description
      t.text :recipe
      t.integer :initial_density_max
      t.integer :initial_density_min
      t.integer :final_density_max
      t.integer :final_density_min
      t.integer :fermentation_temperature_max
      t.integer :fermentation_temperature_min

      t.timestamps
    end
  end
end
