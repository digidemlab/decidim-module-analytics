# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/analytics/version"

Gem::Specification.new do |s|
  s.version = Decidim::Analytics::VERSION
  s.authors = ["Pierre Mesure"]
  s.email = ["pierre@mesu.re"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/digidemlab/decidim-module-analytics"
  s.required_ruby_version = ">= 3.2"

  s.name = "decidim-analytics"
  s.summary = "A decidim analytics module"
  s.description = "A module adding an Analytics tab in the admin panel with an embedded Matomo dashboard."

  s.files = Dir["{app,config,lib}/**/*", "LICENSE-AGPLv3.txt", "Rakefile", "README.md"]

  s.add_dependency "decidim-core", Decidim::Analytics::DECIDIM_VERSION
end
