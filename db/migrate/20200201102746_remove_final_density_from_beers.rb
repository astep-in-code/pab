class RemoveFinalDensityFromBeers < ActiveRecord::Migration[6.0]
  def change

    remove_column :beers, :final_density, :integer
  end
end
