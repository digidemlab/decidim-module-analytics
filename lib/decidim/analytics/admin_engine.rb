# frozen_string_literal: true

module Decidim
  module Analytics
    # This is the engine that runs on the public interface of `Analytics`.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::Analytics::Admin

      routes do
        resources :analytics, :only => [:index]
        root to: "analytics#index"
      end

      initializer "decidim_analytics.admin_mount_routes" do
        Decidim::Core::Engine.routes do
          mount Decidim::Analytics::AdminEngine, at: "/admin/analytics", as: "decidim_admin_analytics"
        end
      end

      initializer "decidim_analytics.admin_menu" do
        Decidim.menu :admin_menu do |menu|
          menu.item I18n.t("menu.analytics", scope: "decidim.analytics"),
                    decidim_admin_analytics.analytics_path,
                    icon_name: "pie-chart",
                    position: 7.2,
                    active: :inclusive,
                    if: allowed_to?(:update, :organization, organization: current_organization) and Rails.application.secrets.dig(:matomo, :enabled)
        end
      end
    end
  end
end
