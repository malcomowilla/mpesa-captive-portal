Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/stk_push', to: 'stk_push#initiate_stk_push'

  get '/fetch_token', to: 'access_token#fetch_token'

end

