Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/about'
  root "static_pages#home"
	get "/about", to: "static_pages#about"
  
  resources :boards #do
  #   resources :songs
  # end

  resources :artists do
    resources :songs
  end

  #custom routes
  #'url', to: 'method' as: 'path'
  get 'new_board_song/:id', to: 'boards#new_song', as: 'new_board_song'
	post 'add_board_song/:id/:song_id', to: 'boards#add_song', as: 'add_board_song'
  delete 'remove_board_song/:id/:song_id', to: 'boards#remove_song', as: 'remove_board_song'

end
