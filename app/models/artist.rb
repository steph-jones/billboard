class Artist < ApplicationRecord
    has_many :songs #, dependent: :destoy
    # has_many :boards, through: songs
end
