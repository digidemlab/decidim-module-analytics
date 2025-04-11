# frozen_string_literal: true

module Decidim
  module Analytics
    module Admin
      class AnalyticsController < Analytics::Admin::ApplicationController
        def index
          @server_address = Rails.application.secrets.dig(:matomo, :server_address)
          @site_id = Rails.application.secrets.dig(:matomo, :site_id)
          @token_auth = Rails.application.secrets.dig(:matomo, :token_auth)

          if @server_address
            content_security_policy.append_csp_directive("frame-src", @server_address)
            content_security_policy.append_csp_directive("connect-src", @server_address)
          end
        end
      end
    end
  end
end
