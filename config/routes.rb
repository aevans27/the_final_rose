Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/bachelorettes/:id/show", to: "bachelorettes#show"
  get "/bachelorettes/:id/contestants", to: "bachelorette_contestants#index"

  get "/contestants/:id", to: "contestants#show"

  get "/outings/:id", to: "outings#show"
  delete "/outings/:id", to: "outings#destroy"
end
