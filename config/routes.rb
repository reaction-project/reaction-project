Rails.application.routes.draw do
  mount ActionImageUploader::UploadEndpoint, at: '/action_images'
  mount CategoryIconUploader::UploadEndpoint, at: '/category_icons'
  mount IssueIconUploader::UploadEndpoint, at: '/issue_icons'
  mount ProfileAvatarUploader::UploadEndpoint, at: '/profile_avatars'

  namespace :admin do
    resources :actions
    resources :categories
    resources :features
    resources :issues
    resources :users

    root to: 'dashboard#index'
  end

  resource :profile, only: [:edit, :show, :update]

  root to: 'pages#home'
end
