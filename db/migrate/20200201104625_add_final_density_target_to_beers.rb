class AddFinalDensityTargetToBeers < ActiveRecord::Migration[6.0]
  def change
    add_column :beers, :final_density_target, :integer
  end
end
