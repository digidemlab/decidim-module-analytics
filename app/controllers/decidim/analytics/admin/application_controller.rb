# frozen_string_literal: true

module Decidim
  module Analytics
    module Admin
      # This controller is the abstract class from which all other controllers
      # in this engine inherit.
      class ApplicationController < Decidim::Admin::ApplicationController
        helper Decidim::Admin::IconLinkHelper
        helper Decidim::Analytics::Admin::ApplicationHelper
      end
    end
  end
end
