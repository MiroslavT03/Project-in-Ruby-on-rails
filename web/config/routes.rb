Rails.application.routes.draw do


root 'static_pages#welcome'

get 'help', to: 'static_pages#help'


resources :articles, :activities
end
