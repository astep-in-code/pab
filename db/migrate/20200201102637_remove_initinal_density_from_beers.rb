class RemoveInitinalDensityFromBeers < ActiveRecord::Migration[6.0]
  def change

    remove_column :beers, :initial_density, :integer
  end
end
