TaxiRails::Application.routes.draw do
  resources :vehicles, :drivers, :trips
end
