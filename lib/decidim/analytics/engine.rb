# frozen_string_literal: true

require "rails"
require "decidim/core"

module Decidim
  module Analytics
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::Analytics

      initializer "decidim_analytics.webpacker.assets_path" do
        Decidim.register_assets_path File.expand_path("app/packs", root)
      end
    end
  end
end
