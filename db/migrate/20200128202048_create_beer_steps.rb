class CreateBeerSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :beer_steps do |t|

      t.timestamps
    end
  end
end
