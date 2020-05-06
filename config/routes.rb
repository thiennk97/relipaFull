Rails.application.routes.draw do
  root to: 'companies#index'
  get "crawl", to: 'companies#crawl_data'
  resources :companies
end
