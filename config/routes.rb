TablesRails::Engine.routes.draw do
  root to: 'tables#index'
  resources :tables, only: [:index, :show]
  match 'tables/result' => 'tables#result'
end
