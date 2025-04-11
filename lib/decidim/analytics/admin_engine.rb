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
        if Rails.application.secrets.dig(:matomo, :enabled)
          Decidim::Core::Engine.routes do
            mount Decidim::Analytics::AdminEngine, at: "/admin", as: "decidim_admin_analytics"
          end
        end
      end

      initializer "decidim_analytics.admin_menu" do
        if Rails.application.secrets.dig(:matomo, :enabled)
          Decidim.menu :admin_menu do |menu|
            menu.add_item :analytics,
                      I18n.t("menu.analytics", scope: "decidim.analytics"),
                      decidim_admin_analytics.analytics_path,
                      icon_name: "pie-chart-2-line",
                      position: 7.2,
                      active: :inclusive,
                      if: allowed_to?(:update, :organization, organization: current_organization)
          end
        end
      end

      initializer "decidim_admin.register_icons" do |_app|
        Decidim.icons.register(name: "pie-chart-2-line", icon: "pie-chart-2-line", category: "system", description: "", engine: :core)
      end
    end
  end
end
