# frozen_string_literal: true

module Decidim
  module Analytics
    # This is the engine that runs on the public interface of `Analytics`.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::Analytics::Admin

      paths["db/migrate"] = nil
      paths["lib/tasks"] = nil

      routes do
        # Add admin engine routes here
        # resources :analytics do
        #   collection do
        #     resources :exports, only: [:create]
        #   end
        # end
        # root to: "analytics#index"
      end

      def load_seed
        nil
      end
    end
  end
end
