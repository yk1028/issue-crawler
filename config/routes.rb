Rails.application.routes.draw do
  root 'home#show'
  get 'home/crawler'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
