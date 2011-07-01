Rails.application.routes.draw do

  root :to => "imagesite/site#index"

  get "site" => "imagesite/site#index" , :as => :site
  get 'information' => 'imagesite/site#information'
  get 'links' => 'imagesite/site#links'
  get 'project/:id' => 'imagesite/projects#show'
#  get 'image/:project_name/:image_name' => 'imagesite/photos#show'

  match 'image/:project_id/:photo_id' => 'imagesite/photos#show'
  match 'thumbimage/:project_id/:photo_id' => 'imagesite/photos#showthumb'

#     resources :projects do
#       resources :photos
#     end


end