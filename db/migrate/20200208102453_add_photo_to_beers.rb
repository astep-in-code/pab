class AddPhotoToBeers < ActiveRecord::Migration[6.0]
  def change
    add_column :beers, :photo, :string
  end
end
