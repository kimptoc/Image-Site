require 'fastimage'

module Imagesite
 class Photo
   attr_accessor :img_file, :caption, :name, :project, :width, :height, :id

   def initialize(name, project)
     @id = Identity.next
     @img_file = name
     @name = name
     @project = project
     @width, @height = FastImage.size(@project.root_dir+@project.name+"/"+@img_file)
   end

   def img_path
     return @project.root_dir+@project.name+"/"+@img_file
   end

   def img_url
     return @project.url_root_dir+@project.name+"/"+@img_file
   end

   def img_thumb_path
     return @project.root_dir+@project.name+"/thumb/"+@img_file
   end

   def img_thumb_url
     return @project.url_root_dir+@project.name+"/thumb/"+@img_file
   end

   def caption_filename
     File.basename(@img_file, ".*")
   end

   def caption
     SiteConfig.load_file_if_exists @project.url_root_dir+@project.name+"/"+caption_filename+".html"
   end
  end
 end