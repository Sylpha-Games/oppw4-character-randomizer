class CreateCharacters < ActiveRecord::Migration[5.2]
  
  def change
    create_table :characters do |t|
      t.string :name
      t.string :image
      t.references :character_category, foreign_key: true
      t.references :action_type, foreign_key: true
      t.timestamps
    end
  end
  
end
