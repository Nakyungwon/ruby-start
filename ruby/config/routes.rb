Rails.application.routes.draw do
  get 'contacts/index'
  get 'contacts/new'
  get 'contacts/create'
  get '/' => 'home#index'
  get '/hello' => 'home#hello_world'
  get '/contact' => 'home#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
