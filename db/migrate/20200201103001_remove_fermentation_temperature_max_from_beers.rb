class RemoveFermentationTemperatureMaxFromBeers < ActiveRecord::Migration[6.0]
  def change

    remove_column :beers, :fermentation_temperature_max, :integer
  end
end
