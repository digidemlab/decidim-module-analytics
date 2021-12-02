# frozen_string_literal: true

module Decidim
  module Analytics
    module Admin
      class AnalyticsController < Analytics::Admin::ApplicationController
        def index
          enforce_permission_to :read, :analytics

          @server_address = Rails.application.secrets.dig(:matomo, :server_address)
          @site_id = Rails.application.secrets.dig(:matomo, :site_id)
          @token_auth = Rails.application.secrets.dig(:matomo, :token_auth)
        end
      end
    end
  end
end
