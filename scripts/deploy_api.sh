#!/bin/bash -xe

# flisol_diario
# ├── app
# └── deployments
#     ├── api-gems
#     └── api-release

set -e

# CLEAN CURRENT APP
#
# This step is covered by using RSync. It only replaces modified files.

# PULL Repo from GitHub
#
bash /home/ubuntu/flisol_diario/deployments/api-release/scripts/pull_repo.sh

# RUN bundle, symlink bundled gems to api/vendor, assets:precompile,
#  migrations, symlink nginx.$RAILS_ENV.conf
#
bash /home/ubuntu/flisol_diario/deployments/api-release/scripts/after_deploy.sh

# SYNC api-release with api folder
#
bash /home/ubuntu/flisol_diario/deployments/api-release/scripts/application_start.sh
