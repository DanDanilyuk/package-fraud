Rails.application.routes.draw do
  resources :addresses do
    resources :reports
  end
end
