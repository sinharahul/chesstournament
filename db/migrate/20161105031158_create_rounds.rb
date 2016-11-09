class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.integer :round_number
      t.references :tournament, foreign_key: true
      t.references :match, foreign_key: true

      t.timestamps
    end
  end
end
