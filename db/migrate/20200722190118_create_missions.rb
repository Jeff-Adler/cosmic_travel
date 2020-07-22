class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.references :planet, null: false, foreign_key: true
      t.references :scientist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
