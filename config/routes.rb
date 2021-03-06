Rails.application.routes.draw do

  devise_for :users

  root to: 'post#index' 

  
  # get 'post/search' => 'post#search'

  get 'post/new' => 'post#new', as:'post_new'

  post 'post/create' => 'post#create'

  get 'post/:id/edit' => 'post#edit' , as:'post_edit'

  get 'post/:id/destroy' => 'post#destroy', as:'post_destroy'
  
  patch 'post/:id/update'=> 'post#update', as:'post_update'

  get 'post/:id/show'=> 'post#show', as:'post_show'

  post 'comment/create' => 'comments#create', as:'comment_create'


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
