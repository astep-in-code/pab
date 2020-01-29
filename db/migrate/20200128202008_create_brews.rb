class CreateBrews < ActiveRecord::Migration[6.0]
  def change
    create_table :brews do |t|
      t.references :beer_id, null: false, foreign_key: true
      t.references :user_id, null: false, foreign_key: true
      t.references :ispindle_id, null: false, foreign_key: true
      t.references :current_brew_step_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
