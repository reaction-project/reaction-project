Rails.application.routes.draw do
  mount IssueIconUploader::UploadEndpoint => '/issue_icons'

  namespace :admin do
    resources :issues

    root to: 'dashboard#index'
  end

  root to: 'pages#home'
end
