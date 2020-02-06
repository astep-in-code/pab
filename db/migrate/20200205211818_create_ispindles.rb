class CreateIspindles < ActiveRecord::Migration[6.0]
  def change
    create_table :ispindles do |t|
      t.string :temperature
      t.string :density

      t.timestamps
    end
  end
end
