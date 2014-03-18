TablesRails::Engine.routes.draw do
  resources :tables, only: [:index, :show]
  match 'tables/result' => 'tables#result'
end
