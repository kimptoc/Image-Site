Rails.application.routes.draw do

  root :to => "imagesite/site#index"

  get "help" => "imagesite/site#help"

  get "site" => "imagesite/site#index" , :as => :site
  get 'project/:id' => 'imagesite/projects#show'

  match ':page' => 'imagesite/site#anypage'

  match 'image/:project_id/:photo_id' => 'imagesite/photos#show'
  match 'thumbimage/:project_id/:photo_id' => 'imagesite/photos#showthumb'

end