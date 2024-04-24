#!/bin/bash -xe

# flisol_diario
# ├── app
# └── deployments
#     ├── api-gems
#     └── api-release

. /home/ubuntu/.profile

cd /home/ubuntu/flisol_diario/deployments/api-release

# PULL from GitHub Repo
# There's an SSH key configured in the server's ~/.ssh folder
# that is allowed to pull changes from the private repo.
#
echo "$(date '+%F %T') Pull from Repo" >> /home/ubuntu/flisol_diario/deployment_logs/001_pull_remote.log 2>&1
git pull origin main >> /home/ubuntu/flisol_diario/deployment_logs/001_pull_remote.log 2>&1
