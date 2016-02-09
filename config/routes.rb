Rails.application.routes.draw do
  root 'home#index'
  post '/confirm', to: 'home#confirm', as: 'confirm'
end
