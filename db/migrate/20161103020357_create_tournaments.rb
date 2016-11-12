class CreateTournaments < ActiveRecord::Migration[5.0]
  def change
    create_table cdo |t|

      t.string :name
      t.integer :rounds

      t.timestamps
    end
  end
end
