class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :featuring
      t.string :position
      t.string :last
      t.string :peak
      t.string :weeks
      t.belongs_to :artist, foreign_key: true
      t.belongs_to :board, foreign_key: true

      t.timestamps
    end
  end
end
