# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "imagesite"
  s.summary = "Insert Imagesite summary."
  s.description = "Insert Imagesite description."
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.version = "0.0.6"

  s.add_runtime_dependency("fastimage")
  s.add_runtime_dependency("jquery-rails")

end