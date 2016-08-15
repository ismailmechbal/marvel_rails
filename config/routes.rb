Rails.application.routes.draw do
  root "marvel#show"
  resources :marvel, only: [:index, :show]
end
