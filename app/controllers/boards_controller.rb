class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def show
    @songs = Song.all.where(board_id: @board.id) 
  end

  # def show_songs
  #   @board.songs do |song|
  #     song.name
  # end

  def new_song
    @songs = Song.all.where(board_id: nil)
  end

  def add_song
    @board.songs << Song.find(params[:song_id])
    redirect_to board_path(@board)
  end

  def remove_song
    Song.find(params[:song_id]).update(board_id: nil)
    redirect_to board_path(@board)
  end
  
  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to board_path(@board.id)
    else  
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if board.update(board_params)
      redirect_to board_path(@board.id)
    else
      render :edit
    end
  end

  def destroy 
    @board.destroy
    redirect_to board_path
  end

  private
    def set_board
      @board = Board.find(params[:id])
    end

    def board_params
      params.require(:board).permit(:name, :description)
    end
end
