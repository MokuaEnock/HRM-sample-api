Rails.application.routes.draw do
  resources :employees
  resources :employers do
    post "employees", to: "user#create_employee"
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
