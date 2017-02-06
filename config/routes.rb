Rails.application.routes.draw do
  mount ActionItemImageUploader::UploadEndpoint, at: '/action_item_images'
  mount CategoryIconUploader::UploadEndpoint, at: '/category_icons'
  mount IssueIconUploader::UploadEndpoint, at: '/issue_icons'

  namespace :admin do
    resources :action_items
    resources :categories
    resources :issues

    root to: 'dashboard#index'
  end

  root to: 'pages#home'
end
