class AddFermentationTemperatureTargetToBeers < ActiveRecord::Migration[6.0]
  def change
    add_column :beers, :fermentation_temperature_target, :integer
  end
end
