class AddStatusToBrewSteps < ActiveRecord::Migration[6.0]
  def change
    add_column :brew_steps, :status, :integer
  end
end
