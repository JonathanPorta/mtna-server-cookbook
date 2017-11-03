include ./ops/Makefile

REPO_SLUG=$(shell cat ./package.json | jq -er .repository)
VERSION=$(shell cat ./package.json | jq -er .version)

test: test_spec	test_lint test_integration
test_ci: test_spec test_lint

test_spec:
	chef exec rspec test/unit

test_integration:
	chef exec kitchen test

test_lint: test_lint_ruby	test_lint_chef

test_lint_ruby:
	chef exec rubocop

test_lint_chef:
	chef exec foodcritic -t correctness,style .

build:
	chef exec berks vendor cookbooks

watch:
	chef exec rubocop
