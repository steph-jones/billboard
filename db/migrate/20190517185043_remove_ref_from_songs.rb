class RemoveRefFromSongs < ActiveRecord::Migration[5.2]
  def change
    remove_reference :songs, :board, foreign_key: true
  end
end
