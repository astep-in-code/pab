class RemoveFinalDensityMinFromBeers < ActiveRecord::Migration[6.0]
  def change

    remove_column :beers, :final_density_min, :integer
  end
end
