#!/usr/bin/env bash

S3_BUCKET_NAME="david-huculak-dot-com-staticclientbucket-1u9s1y54u0ymv"

aws s3 sync ./ s3://$S3_BUCKET_NAME \
  --delete \
  --exclude "*.html" \
  --exclude ".git/*" \
  --exclude ".gitignore" \
  --exclude "README.md" \
  --exclude "deploy.sh" \
  --exclude "cloudformation.yaml"

# include Cache-Control: no-cache for html files
aws s3 cp ./ s3://$S3_BUCKET_NAME \
  --recursive \
  --exclude "*" \
  --include "*.html" \
  --cache-control "no-cache"