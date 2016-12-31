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
	chef exec foodcritic -f any .

package:
	chef exec berks vendor cookbooks
	bash package.sh

release: _install_package_cloud_deps _push_rpm
_install_package_cloud_deps:
	gem install package_cloud

_push_rpm:
	package_cloud version
	package_cloud push PronghornDigital/mtna-server-cookbook/fedora/23 ./*.rpm
	package_cloud push PronghornDigital/mtna-server-cookbook/fedora/24 ./*.rpm
	package_cloud push PronghornDigital/mtna-server-cookbook/fedora/25 ./*.rpm

watch:
	chef exec rubocop
