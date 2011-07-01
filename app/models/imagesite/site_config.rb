module Imagesite

class SiteConfig

  attr_accessor :projects, :site_title, :page_title

  @@instance = nil

  FILE_ROOT_DIR="."
  URL_ROOT_DIR = "/siteconfig/"
  SITE_ROOT_DIR=FILE_ROOT_DIR+URL_ROOT_DIR

#  def self.initialize
#    @@instance = SiteConfig.new
#  end

  def initialize
    @site_title = "Site Title" # todo - get this from config yaml
    @page_title = "Page Title" # todo - get this from config yaml
    @projects = []


    Dir.foreach SITE_ROOT_DIR do |entry|
      Rails.logger.debug "Checking entry:#{entry}"
      path = SITE_ROOT_DIR+entry

      if entry != "." and entry != ".." and File.directory? path
        Rails.logger.debug "Entry is a project directory"
        @projects << Project.new(entry, SITE_ROOT_DIR, URL_ROOT_DIR)
      end
    end

#    @projects << Project.new("Bracknell")
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
    self.projects.select do |p|
      Rails.logger.debug "Looking for project:#{id}, checking:#{p.id}"
      p.id == id
    end.first
  end

  def self.instance
    @@instance = SiteConfig.new unless @@instance.present?
    return @@instance
  end

  def self.load_file_if_exists(filename)
    if File.exists? filename
      IO.read filename
    else
      ""
    end
  end


end


end
