#!/bin/bash -xe

# flisol_diario
# ├── app
# └── deployments
#     ├── api-gems
#     └── api-release

. /home/ubuntu/.profile

# DEPLOY in release folder
#
cd /home/ubuntu/flisol_diario/deployments/api-release

# INSTALL gems
#
echo "$(date '+%F %T') Installing deployment gems" >> /home/ubuntu/flisol_diario/deployment_logs/002_bundle_install.log 2>&1
bundle install --deployment \
  --without development test \
  --path /home/ubuntu/flisol_diario/deployments/api-gems/bundle \
  >> /home/ubuntu/flisol_diario/deployment_logs/002_bundle_install.log 2>&1

# SYMLINK api-gems to api/vendor/bundle
#
echo "$(date '+%F %T') Symlink api-gems to vendor/bundle" >> /home/ubuntu/flisol_diario/deployment_logs/003_bundle_symlink.log 2>&1
ln -fsv /home/ubuntu/flisol_diario/deployments/api-gems/bundle /home/ubuntu/flisol_diario/app/vendor/ >> /home/ubuntu/flisol_diario/deployment_logs/003_bundle_symlink.log 2>&1

# SYMLINK NVM node to /usr/local/bin/node
#
echo "$(date '+%F %T') Symlink NVM node to /usr/local/bin/node" >> /home/ubuntu/flisol_diario/deployment_logs/004_node_symlink.log 2>&1
cat ~/.clave | sudo -S ln -sfv /home/ubuntu/.nvm/versions/node/v20.12.2/bin/node /usr/local/bin/node >> /home/ubuntu/flisol_diario/deployment_logs/004_node_symlink.log 2>&1

# COMPILE assets
#
echo "$(date '+%F %T') Compiling assets" >> /home/ubuntu/flisol_diario/deployment_logs/005_assets_precompile.log 2>&1
RAILS_ENV=$RAILS_ENV SECRET_KEY_BASE=$SECRET_KEY_BASE bundle exec rake assets:precompile >> /home/ubuntu/flisol_diario/deployment_logs/005_assets_precompile.log 2>&1

# Run migrations
#
echo "$(date '+%F %T') Running migrations" >> /home/ubuntu/flisol_diario/deployment_logs/006_migration.log 2>&1
RAILS_ENV=$RAILS_ENV SECRET_KEY_BASE=$SECRET_KEY_BASE bundle exec rake db:migrate RAILS_ENV=$RAILS_ENV >> /home/ubuntu/flisol_diario/deployment_logs/006_migration.log 2>&1

# SYMLINK nginx configuration file to /etc/nginx/sites-enabled
#
echo "$(date '+%F %T') Symlinking nginx configuration file" >> /home/ubuntu/flisol_diario/deployment_logs/007_nginx_symlink.log 2>&1
sudo ln -fs /home/ubuntu/flisol_diario/app/config/nginx.flisol_diario.$RAILS_ENV.conf /etc/nginx/sites-enabled/
