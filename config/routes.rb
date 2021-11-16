Rails.application.routes.draw do

  devise_for :users

  root to: 'post#index'

  get 'post/new' => 'post#new', as:'post_new'

  post 'post/create' => 'post#create'

  get 'post/:id/edit' => 'post#edit' , as:'post_edit'

  get 'post/:id/destroy' => 'post#destroy', as:'post_destroy'
  
  patch 'patch/:id/update'=> 'post#update', as:'post_update'


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
