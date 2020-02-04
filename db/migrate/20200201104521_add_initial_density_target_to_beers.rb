class AddInitialDensityTargetToBeers < ActiveRecord::Migration[6.0]
  def change
    add_column :beers, :initial_density_target, :integer
  end
end
