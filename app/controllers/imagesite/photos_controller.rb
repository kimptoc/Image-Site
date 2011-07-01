module Imagesite

  class PhotosController < ImagesiteApplicationController

    def show
      project_id = params[:project_id]
      image_id = params[:photo_id]

      project = SiteConfig.project project_id

      image = project.image image_id

      send_file image.img_path, :type => "image"
    end

    def showthumb
      project_id = params[:project_id]
      image_id = params[:photo_id]

      project = SiteConfig.project project_id

      image = project.image image_id

      send_file image.img_thumb_path, :type => "image"
    end

  end

end

