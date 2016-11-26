class CreateTournaments < ActiveRecord::Migration[5.0]
  def change
    create_table do |t|

      t.string :name
      t.integer :rounds

      t.timestamps
    end
  end
end
