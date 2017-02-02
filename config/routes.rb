Rails.application.routes.draw do
  mount CategoryIconUploader::UploadEndpoint, at: '/category_icons'
  mount IssueIconUploader::UploadEndpoint, at: '/issue_icons'

  namespace :admin do
    resources :categories
    resources :issues

    root to: 'dashboard#index'
  end

  root to: 'pages#home'
end
