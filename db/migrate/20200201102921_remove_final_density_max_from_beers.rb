class RemoveFinalDensityMaxFromBeers < ActiveRecord::Migration[6.0]
  def change

    remove_column :beers, :final_density_max, :integer
  end
end
