module Imagesite
 class Project

   attr_accessor :name, :photos, :root_dir, :url_root_dir, :id

   def image? filename
     filename.downcase[-3..-1] == "jpg" or filename.downcase[-4..-1] == "jpeg" or filename.downcase[-3..-1] == "png"
   end

   def image id
     id = Integer(id)
     @photos.each do |ph|
       Rails.logger.debug "Looking for photo with filename:#{id}, checking #{ph.id}"
       return ph if ph.id == id
     end
     return nil
   end

   def initialize(name, root_dir, url_root_dir)
     @id = Identity.next
     @name = name
     @root_dir = root_dir
     @url_root_dir = url_root_dir
     @photos = []
     Dir.foreach root_dir+name do |file|
       fullpath = root_dir+name+"/"+file
       Rails.logger.debug "Checking for photo:#{fullpath}"
       if File.file? fullpath and image? file
         Rails.logger.debug "is a file"
         @photos << Photo.new(file, self)
       else
         Rails.logger.debug "not a file"
       end
     end
   end

  end
 end