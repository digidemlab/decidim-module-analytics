# frozen_string_literal: true

require "rails"
require "decidim/core"

module Decidim
  module Analytics
    # This is the engine that runs on the public interface of analytics.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::Analytics
    end
  end
end
