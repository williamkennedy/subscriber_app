Rails.application.routes.draw do
  resources :subscribers, only: %i[new create] do
    collection do
      get :thank_you
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
