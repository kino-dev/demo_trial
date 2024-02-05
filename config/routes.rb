Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post 'news/AddComment'
  get 'news/DisplayTop4Articles'
  get 'news/ShowCategory'
  get 'news/ShowArticle'
  get 'news/ShowSearchResult'
  root "news#DisplayTop4Articles"

  post 'admin_controls/adminlogin'

  resources :news
  get 'admin_controls/index'
  get 'admin_controls/show'
  get 'admin_controls/new'
  get 'admin_controls/create'
  get 'admin_controls/edit'
  get 'admin_controls/destroy'
  post 'admin_controls/update'
  post 'admin_controls/create'
  patch 'admin_controls/update'

  get 'admin_controls/adminhome'
  get 'admin_controls/new_category'
  post 'admin_controls/create_category'
  get 'admin_controls/list_category'
  get 'admin_controls/edit_category'
  patch 'admin_controls/update_category'
  get 'admin_controls/delete_category'

  get 'admin_controls/visibility'
  # Defines the root path route ("/")
  # root "articles#index"
end
