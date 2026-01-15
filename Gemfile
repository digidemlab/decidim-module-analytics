# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

# Inside the development app, the relative require has to be one level up, as
# the Gemfile is copied to the development_app folder (almost) as is.
base_path = ""
base_path = "../" if File.basename(__dir__) == "development_app"
require_relative "#{base_path}lib/decidim/analytics/version"

DECIDIM_VERSION = Decidim::Analytics::DECIDIM_VERSION

gem "decidim", DECIDIM_VERSION
gem "decidim-analytics", path: "."

gem "bootsnap", "~> 1.17"
gem "puma", ">= 6.4"

group :development, :test do
  gem "byebug", platform: :mri
  gem "decidim-dev", DECIDIM_VERSION
  gem "rspec-rails"
end

group :development do
  gem "faker"
  gem "letter_opener_web"
  gem "listen"
  gem "spring"
  gem "web-console"
end
