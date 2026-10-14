# frozen_string_literal: true

require "decidim/analytics/admin"
require "decidim/analytics/engine"
require "decidim/analytics/admin_engine"

module Decidim
  # This namespace holds the logic of the `Analytics` component. This component
  # allows users to create analytics in a participatory space.
  module Analytics
    include ActiveSupport::Configurable

    config_accessor :matomo do
      {
        enabled: ENV["MATOMO_SERVER_ADDRESS"].present?,
        server_address: ENV["MATOMO_SERVER_ADDRESS"].presence,
        viewer_address: ENV["MATOMO_VIEWER_ADDRESS"].presence,
        site_id: ENV["MATOMO_SITE_ID"].presence,
        token_auth: ENV["MATOMO_TOKEN_AUTH"].presence,
      }
    end
  end
end
