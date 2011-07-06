module Imagesite

class ImagesiteApplicationController < ::ApplicationController

  before_filter :sidebar_setup

  layout "imagesite/layouts/imagesite_application"

  def sidebar_setup
    @projects = SiteConfig.projects
    @site_title = SiteConfig.site_title
    @page_title = SiteConfig.page_title
    @site_footer = SiteConfig.site_footer
  end

end

end