class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :result
      t.references :player, foreign_key: true
      t.references :other_player
      t.timestamps



    end
  end
end
