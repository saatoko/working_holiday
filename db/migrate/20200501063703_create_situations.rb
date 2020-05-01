class CreateSituations < ActiveRecord::Migration[6.0]
  def change
    create_table :situations do |t|
      t.references :country,   null: false, foreign_key: true
      t.string     :situation, null: false
      t.timestamps
    end
  end
end
