Rails.application.routes.draw do
  root to: 'home#index'

  resources :home, only: :index do
    collection do
      get :import_new_data
      post :add_data
    end
  end
end
