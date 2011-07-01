module Imagesite

  class ProjectsController < ImagesiteApplicationController

  def show
    @project = SiteConfig.project params[:id]

    Rails.logger.debug "project:#{@project}"

    @slideshow_effect = 'fade'


    about_file = SiteConfig::SITE_ROOT_DIR+"/"+@project.name+"/about.html"

    if File.exist? about_file
      @about_part_html = IO.read (about_file)
    else
      @about_part_html = "The #{@project.name} project."
    end
  end

  end

end

