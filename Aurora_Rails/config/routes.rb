AuroraRails::Application.routes.draw do
  get "aurora/home"
  resources :drivers
  resources :vehicles do
    get 'drive', :on => :collection
  end
end