# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/analytics/version"

Gem::Specification.new do |s|
  s.version = Decidim::Analytics.version
  s.authors = ["Pierre Mesure"]
  s.email = ["pierre@mesu.re"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/decidim/decidim-module-analytics"
  s.required_ruby_version = ">= 2.6"

  s.name = "decidim-analytics"
  s.summary = "A decidim analytics module"
  s.description = "A module adding an Analytics tab in the admin panel to view Matomo or Google analytics."

  s.files = Dir["{app,config,lib}/**/*", "LICENSE-AGPLv3.txt", "Rakefile", "README.md"]

  s.add_dependency "decidim-core", Decidim::Analytics.version
end
