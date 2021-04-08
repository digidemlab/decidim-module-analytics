# Decidim::Analytics

This module does two things:
- it enables tracking through Matomo
- it adds a tab in the admin panel showing one Matomo dashboard (or more) of your choice

![Preview of the module](screenshot.png)
## Usage

You will of course need to have Matomo running on a server or the cloud version (untested).

The module doesn't have any settings panel as I don't want to write anything in the database. It will pick the data it needs from Rails secrets:

```
matomo:
    enabled: true # Enables tracking and displays the admin tab
    server_address: https://matomo.example.org/ # The URL of your Matomo instance
    site_id: 1 # The Matomo site ID of the Decidim platform
    token_auth: 6a710da82ecb933866507c14bdb99351 # A Matomo authentication token (read-only).
```

Follow [these instructions](https://matomo.org/docs/embed-matomo-reports/#embed-piwik-widgets-on-a-password-protected-or-private-page) to get `token_auth` from Matomo.

The dashboard that will be shown on page load is using the default layout you set for all new dashboard. You can create several other dashboards for the user and you will be able to switch between them from Decidim.
## Installation

1. Add this line to your application's Gemfile:

```ruby
gem "decidim-analytics", git: "https://github.com/digidemlab/decidim-module-analytics"
```

And then execute:

```bash
bundle
```

2. To enable tracking, you will need to add the following line in the file `app/views/layouts/decidim/_head_extra.html.erb`:
```
<%= render partial: "layouts/decidim/matomo" %>
```
You can use this module without the provided tracking snippet and write your own, just skip the above step.

3. Don't forget to set the above secrets in your `config/secrets.yml`. I recommend using environment variables so the secrets should look something like that:

```
matomo:
    enabled: <%= !ENV["MATOMO_SITE_ID"].blank? %>
    server_address: <%= ENV["MATOMO_SERVER_ADDRESS"] %>
    site_id: <%= ENV["MATOMO_SITE_ID"] %>
    token_auth: <%= ENV["MATOMO_TOKEN_AUTH"] %>
```

At Digidem Lab, we actually set the site ID dynamically when deploying through Ansible. Don't hesitate to [have a look](https://github.com/digidemlab/decidim-ansible/blob/master/roles/matomo/tasks/main.yml)!
## Contributing

Create an issue or a PR if you want to suggest an improvement. Keep in mind I'd like to keep this module lightweight and simple to maintain.

## License

This module is distributed under the GNU AFFERO GENERAL PUBLIC LICENSE.
