class RemoveInitinalDensityMinFromBeers < ActiveRecord::Migration[6.0]
  def change

    remove_column :beers, :initial_density_min, :integer
  end
end
