class RemoveRefFromBoards < ActiveRecord::Migration[5.2]
  def change
    remove_reference :boards, :song, foreign_key: true
  end
end
