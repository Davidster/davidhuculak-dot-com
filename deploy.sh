#!/usr/bin/env bash

eval $(assume-role david)

aws s3 sync ./ s3://davidhuculak-dot-com-staticclientbucket-3ahpjym8isbn --exclude ".git/*" --exclude ".gitignore" --exclude "README.md" --exclude "cf-template.template"
