Whatdo::Application.routes.draw do
  root "high_voltage/pages#show", id: "home"

  devise_for :users
  resources  :users, only: [:show]
  resources  :ideas do
    member do
      put :vote
    end
  end

  match "/browse", to: "ideas#index", via: "get"

end