module Imagesite

class SiteConfig

  attr_accessor :projects, :site_title, :page_title, :homepage_image_project, :meta

  @@instance = nil

  FILE_ROOT_DIR="."
  URL_ROOT_DIR = "/siteconfig/"
  SITE_ROOT_DIR=FILE_ROOT_DIR+URL_ROOT_DIR

#  def self.initialize
#    @@instance = SiteConfig.new
#  end

  def initialize

    @config = {}
    rawconfig = YAML.load_file FILE_ROOT_DIR+URL_ROOT_DIR+"siteconfig.yml"
    @config = rawconfig["siteconfig"] if rawconfig.present?
    Rails.logger.debug "config:#{@config.nil?}"
    Rails.logger.debug "site title:#{@config["sitetitle"]}"
    @site_title = @config["sitetitle"] || "Site Title"
    @page_title = @config["pagetitle"] || "Page Title"
    @meta = @config["meta"] || {}
    homepage_imagedir = @config["homepage_imagedir"]

    if File.directory? SITE_ROOT_DIR+ homepage_imagedir
      Rails.logger.debug "Loading homepage imagedir: #{homepage_imagedir}"
      @homepage_image_project = Project.new(homepage_imagedir, SITE_ROOT_DIR, URL_ROOT_DIR)
    end
    Rails.logger.debug "homepage image project2:#{@homepage_image_project}"

    @projects = []


    Dir.entries(SITE_ROOT_DIR).sort.each do |entry|
      Rails.logger.debug "Checking entry:#{entry}"
      path = SITE_ROOT_DIR+entry

      if entry != "." and entry != ".." and File.directory? path and entry != homepage_imagedir
        Rails.logger.debug "Entry is a project directory"
        @projects << Project.new(entry, SITE_ROOT_DIR, URL_ROOT_DIR)
      end
    end

#    @projects << Project.new("Bracknell")
  end

  def self.homepage_photos
    Rails.logger.debug "homepage image project:#{SiteConfig.instance.homepage_image_project}"
    return SiteConfig.projects.flat_map { |p| p.photos.sample(5) }.shuffle unless SiteConfig.instance.homepage_image_project.present?

    return SiteConfig.instance.homepage_image_project.photos
  end

  def self.projects
    SiteConfig.instance.projects
  end

  def self.site_title
    SiteConfig.instance.site_title
  end

  def self.page_title
    SiteConfig.instance.page_title
  end

  def self.project(id)
    id = Integer(id)
    Rails.logger.debug "Looking for project:#{id}"
    return SiteConfig.instance.homepage_image_project if SiteConfig.instance.homepage_image_project && SiteConfig.instance.homepage_image_project.id == id
    self.projects.select do |p|
      Rails.logger.debug "Looking for project:#{id}, checking:#{p.id}"
      p.id == id
    end.first
  end

  def self.instance
    @@instance = SiteConfig.new unless @@instance.present?
    return @@instance
  end

  def self.site_footer
    load_file_if_exists SITE_ROOT_DIR+"/footer.html"
  end

  def self.load_file_if_exists(filename)
    if File.exists? filename
      Rails.logger.debug "loading file:#{filename}"
      IO.read filename
    else
      Rails.logger.debug "File not found:#{filename}"
      ""
    end
  end


end


end
