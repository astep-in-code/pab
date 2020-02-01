class AddNameToBeers < ActiveRecord::Migration[6.0]
  def change
    add_column :beers, :name, :string
  end
end
