class RemoveStatusFromBrewSteps < ActiveRecord::Migration[6.0]
  def change

    remove_column :brew_steps, :status, :string
  end
end
