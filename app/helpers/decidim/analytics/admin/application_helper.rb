# frozen_string_literal: true

module Decidim
  module Analytics
    module Admin
      module ApplicationHelper
        def matomo_dashboard_url
          return '#' if @server_address.blank? || @site_id.blank? || @token_auth.blank?

          params = {
            module: 'Widgetize',
            action: 'iframe',
            moduleToWidgetize: 'Dashboard',
            actionToWidgetize: 'index',
            idSite: @site_id,
            period: 'week',
            date: 'yesterday',
            token_auth: @token_auth
          }

          "#{@server_address}/index.php?#{params.to_query}"
        end
      end
    end
  end
end
