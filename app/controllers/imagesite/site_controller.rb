module Imagesite

class SiteController < ImagesiteApplicationController

  CYCLE_EFFECTS = [
          'blindX',
        'blindY',
        'blindZ',
        'cover',
        'curtainX',
        'curtainY',
        'fade',
        'fadeZoom',
        'growX',
        'growY',
        'scrollUp',
        'scrollDown',
        'scrollLeft',
        'scrollRight',
        'scrollHorz',
        'scrollVert',
        'shuffle',
        'slideX',
        'slideY',
        'toss',
        'turnUp',
        'turnDown',
        'turnLeft',
        'turnRight',
        'uncover',
        'wipe',
        'zoom']

  def index

    @body_part_html = SiteConfig.load_file_if_exists(SiteConfig::SITE_ROOT_DIR+"/index.html")

    @sample_photos = SiteConfig.homepage_photos

#    @slideshow_effect = CYCLE_EFFECTS.sample
    @slideshow_effect = "fade"

  end

  def anypage

    page = params[:page]

    page_file = SiteConfig::instance.file_for_page page
    render_from_file(SiteConfig::SITE_ROOT_DIR+"/"+page_file) if page_file.present?

    render(:text => "Page #{page} was not found", :status => 404) unless page_file.present?
  end


  def help

  end

#private:
  def render_from_file(filename)

    @body_part_html = SiteConfig.load_file_if_exists(filename)

    Rails.logger.debug "body part = #{@body_part_html}."

    @body_part_html = "CONFIGURATION ERROR: Failed to find file #{filename}" unless @body_part_html.present?

    render "imagesite/shared/passthru"
  end


end

end
