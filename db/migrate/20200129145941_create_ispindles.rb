class CreateIspindles < ActiveRecord::Migration[6.0]
  def change
    create_table :ispindles do |t|
      t.integer :temperature
      t.integer :density

      t.timestamps
    end
  end
end
