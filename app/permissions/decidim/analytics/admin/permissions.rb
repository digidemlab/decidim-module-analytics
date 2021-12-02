

# frozen_string_literal: true

module Decidim
  module Analytics
    module Admin
      class Permissions < Decidim::DefaultPermissions
        def permissions
          return permission_action if permission_action.scope != :admin
          return permission_action unless user&.admin?

          allow! if read_analytics?

          permission_action
        end

        def read_analytics?
          permission_action.subject == :analytics &&
            permission_action.action == :read
        end
      end
    end
  end
end
