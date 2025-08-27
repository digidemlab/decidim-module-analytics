# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'decidim/analytics/version'

Gem::Specification.new do |s|
  s.version = Decidim::Analytics::VERSION
  s.authors = ['Pierre Mesure']
  s.email = ['pierre@mesu.re']
  s.license = 'AGPL-3.0'
  s.homepage = 'https://github.com/platoniq/decidim-module-analytics'
  s.metadata['rubygems_mfa_required'] = 'true'
  s.required_ruby_version = '>= 3.3.4'

  s.name = 'decidim-analytics'
  s.summary = 'A decidim analytics module'
  s.description = 'A module adding an Analytics tab in the admin panel with an embedded Matomo dashboard.'

  s.files = Dir['{app,config,lib}/**/*', 'LICENSE-AGPLv3.txt', 'Rakefile', 'README.md']

  s.add_dependency 'decidim-admin', Decidim::Analytics::DECIDIM_VERSION
  s.add_dependency 'decidim-core', Decidim::Analytics::DECIDIM_VERSION

  s.add_development_dependency 'decidim-dev', Decidim::Analytics::DECIDIM_VERSION

  s.metadata['homepage_uri'] = s.homepage
  s.metadata['source_code_uri'] = 'https://github.com/platoniq/decidim-module-analytics'
  s.metadata['bug_tracker_uri'] = 'https://github.com/platoniq/decidim-module-analytics/issues'
end
