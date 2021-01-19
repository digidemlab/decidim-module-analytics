# frozen_string_literal: true

require "rails"
require "decidim/core"

module Decidim
  module Analytics
    # This is the engine that runs on the public interface of analytics.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::Analytics

      routes do
        # Add engine routes here
        # resources :analytics
        # root to: "analytics#index"
      end

      initializer "decidim_analytics.assets" do |app|
        app.config.assets.precompile += %w[decidim_analytics_manifest.js decidim_analytics_manifest.css]
      end
    end
  end
end
