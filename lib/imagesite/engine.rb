module Imagesite
  class Engine < Rails::Engine

#    initialize "imagesite.load_app_instance_data" do |app|
#      Imagesite.setup do |config|
#        config.app_root = app.root
#      end
#    end

#    initialize "imagesite.load_static_assets" do |app|
#      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
#    end

    initializer "static assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end

  end

end