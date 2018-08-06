Rails.application.routes.draw do

   get 'article', to:'pages#article'
   resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
