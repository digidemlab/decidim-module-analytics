# frozen_string_literal: true

module Decidim
  module Analytics
    # This is the engine that runs on the admin interface of `decidim-analytics`.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::Analytics::Admin

      paths["db/migrate"] = nil
      paths["lib/tasks"] = nil

      routes do
        # Add admin routes here
        root to: "analytics#index"
        resources :analytics, only: [:index]
      end

      initializer "decidim_analytics.admin_mount_routes" do
        Decidim::Core::Engine.routes do
          mount Decidim::Analytics::AdminEngine, at: "/admin/analytics", as: "decidim_admin_analytics"
        end
      end

      initializer "decidim_analytics.admin_menu" do
        Decidim.menu :admin_menu do |menu|
          menu.add_item :analytics,
                        I18n.t("menu.analytics", scope: "decidim.analytics"),
                        decidim_admin_analytics.root_path,
                        icon_name: "bar-chart-2-line",
                        position: 7.5,
                        active: :inclusive,
                        if: allowed_to?(:read, :admin_dashboard)
        end
      end

      def load_seed
        nil
      end
    end
  end
end