# Project settings
PROJECT  := exampleapp       # name of your apiary.io project
SSH_HOST := user@host.com    # user/hostname of your webserver
WEB_ROOT := /var/www/apiary  # directory your webserver serves files from

# Replaces '/' in branchnames if using git-flow:
# feature/PRJ-101-fix-spelling --> feature-PRJ-101-fix-spelling
BRANCHNAME := $(shell git rev-parse --abbrev-ref HEAD | sed "s/\//-/g")

.PHONY: all
all: apiary

# Make rule to convert Apiary blueprints to HTML
%.html: %.apib
	aglio -t slate -i $< -o $@

# Use the `snowcrash` tool to check for syntax errors
.PHONY: check
check: apiary.apib
	snowcrash -l $<

# This command will run a local server for the apiary docs at "localhost:3000"
.PHONY: apiary
apiary: apiary.apib
	aglio -t slate -i $< -s

# Deploy your Apiary branch to your development server
.PHONY: deploy
deploy: apiary.html
	scp $< $(SSH_HOST):$(WEB_ROOT)/$(BRANCHNAME).html

# Publish your Apiary docs to the Apiary website
.PHONY: publish
publish: check
	apiary publish --api-name $(PROJECT)
