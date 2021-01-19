# Decidim::Analytics

A module adding an Analytics tab in the admin panel to embed a Matomo or Google analytics dashboard.

## Usage

This module only works with Matomo so far.

It doesn't have any settings but will pick the data it needs from environment variables:
```
matomo:
    enabled: <%= !ENV["MATOMO_SITE_ID"].blank? %>
    site_id: 1
    token_auth: 6a710da82ecb933866507c14bdb99351
```

If `enabled = true`, it shows a tab in the admin panel called Analytics.

That tab simply shows an embedded dashboard from Matomo. This dashboard is the default one that has been set for the user that owns the `token_auth`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "decidim-analytics"
```

And then execute:

```bash
bundle
```

## Contributing

See [Decidim](https://github.com/decidim/decidim).

## License

This engine is distributed under the GNU AFFERO GENERAL PUBLIC LICENSE.
