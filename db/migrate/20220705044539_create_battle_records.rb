class CreateBattleRecords < ActiveRecord::Migration[5.2]
  
  def change
    create_table :battle_records do |t|
      t.references :user, foreign_key: true
      t.references :character, foreign_key: true
      t.references :rank, foreign_key: true
      t.references :stage, foreign_key: true
      t.integer :point
      t.timestamps
    end
  end
  
end
