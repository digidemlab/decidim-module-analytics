# frozen_string_literal: true

module Decidim
  module Analytics
    module Admin
      class AnalyticsController < Analytics::Admin::ApplicationController
        def index
          @server_address = matomo_config[:server_address]
          @site_id = matomo_config[:site_id]
          @token_auth = matomo_config[:token_auth]

          if missing_config?
            flash.now[:alert] = t("decidim.analytics.admin.missing_config")
          end
        end

        private

        def matomo_config
          @matomo_config ||= Rails.application.secrets.dig(:matomo) || {}
        end

        def missing_config?
          @server_address.blank? || @site_id.blank? || @token_auth.blank?
        end
      end
    end
  end
end
