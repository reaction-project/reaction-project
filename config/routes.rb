Rails.application.routes.draw do
  mount IssueIconUploader::UploadEndpoint => '/issue_icons'

  root to: 'pages#home'
end
