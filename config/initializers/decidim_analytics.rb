Decidim::Analytics.matomo = {
  enabled: ENV["MATOMO_SERVER_ADDRESS"].present?,
  server_address: ENV["MATOMO_SERVER_ADDRESS"].presence,
  viewer_address: ENV["MATOMO_VIEWER_ADDRESS"].presence,
  site_id: ENV["MATOMO_SITE_ID"].presence,
  token_auth: ENV["MATOMO_TOKEN_AUTH"].presence,
}
