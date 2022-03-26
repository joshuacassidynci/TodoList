Rails.application.routes.draw do
  resources :todos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root :controller=>'todos', :action=>'index'
  get "/another_page", :controller=>'todos', :action=>'another_page'
end
