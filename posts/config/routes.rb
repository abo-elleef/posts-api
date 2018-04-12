Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  mount API::Base, at: "/"

  get 'posts' => 'posts#all'
  get 'posts/:id' => 'posts#show'
  post 'posts' => 'posts#create'
  delete 'posts/:id' => 'posts#destroy'
end
