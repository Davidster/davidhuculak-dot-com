#!/usr/bin/env bash

aws s3 sync --profile default \
  ./ s3://david-huculak-dot-com-staticclientbucket-1u9s1y54u0ymv \
  --exclude ".git/*" \
  --exclude ".gitignore" \
  --exclude "README.md" \
  --exclude "cloudformation.yaml"
