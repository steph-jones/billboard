class AddRefToSongs < ActiveRecord::Migration[5.2]
  def change
    add_reference :songs, :board, foreign_key: true
  end
end
