varnish Cookbook CHANGELOG
==========================
This file is used to list changes made in each version of the varnish cookbook.

v3.4.0
------
- Adds support Varnish 5
- Updates reload-vcl file from upstream packaging
- Add varnish5 TravisCI tests

Known Bugs:
- Specifying `5.0` as the major version can cause an older version to be installed, use `5` instead. https://github.com/sous-chefs/varnish/issues/150

v3.3.1
------
- Remove upper bound on yum cookbook dependency. #147
- Add repo_gpgcheck to redhat varnish repo. #145

v3.3.0
------
- Updates to the new upstream varnish repo. https://github.com/sous-chefs/varnish/issues/140
- Deprecates using the upstream varnish 4 repo on CentOS 7 (distro version still works). https://github.com/sous-chefs/varnish/issues/142

v3.2.0
------
- Links /etc/sysconfig/varnishlog and varnishncsa to defaults file in /etc/default. Fixes https://github.com/sous-chefs/varnish/issues/125.
- Fixes default varnishncsa format string (double quotes where getting added).
- Fixes an conflict when using both varnishlog and varnishncsa.
- Fixes distro_install integration tests. https://github.com/sous-chefs/varnish/issues/126
- Reverts the removal of reload-vcl since this is not fixed upstream in ubuntu's system packages yet.

v3.1.0
------
- Varnish expects the varnish instance name to be `hostname` by default however this is sometimes different then `hostname -s` which is used by `ohai's hostname`. This seemed to only be an issue on CentOS 7.2.
- Use /etc/varnish/varnish.params for systemd init file. This is what the package uses and I think will remove some confusion about how settings are set. #103
- Remove /usr/share/varnish/reload-vcl on debian. This was added to support the '-j' option in varnish 4.1 however it has been fixed upstream.
- including yum-epel for centos
- Removing old testing files(CircleCi, kitchen-rackspace, rake) and replacing with (TravisCI, kitchen-dokken, delivery).
- adding integration testing in ci.

v3.0.0
------
- Move recipes in default to custom resources / Move recipe and lwrp defaults config to custom resource
- Remove unused properties
- Don't append '.vcl' to file name
- Fix percent_of_total_mem function
- Include default recipe in integrations tests
- Add configure recipe
- Don't use default recipe to install/setup varnish
- Don't fetch the repository key over insecure HTTP

v2.4.0
-----
- Add additional attributes to allow use of template source from a wrapper cookbook
- Move define_systemd_daemon_reload to helpers (#97)
- Fix Chef::Exceptions::ChecksumMismatch error
- Set Ruby vers to 2.2.3 to satisfy ruby_dep requirements (#104)

v2.3.0
------
- Fix chef 12.5 compatibility. This required a bunch of workarounds we should fix later.

v2.2.2
------

- #86 - Removed monkey patching of service providers

v2.2.1
-------------------
- Fix a bug in the monkey patched service resource, so that the changes needed for Varnish don't affect other services. #83.
- Update docs, Rakefile, standards. #79.
- Add additional examples to the documentation. #74.

v2.2.0
-------------------
- Fix default storage bug. Specify a default file storage location, as one is required with file backend, fixes #72. Adjust template for default configuration of varnish so that it won't do the file backend without a path, since that's illegal syntax.

- Cause varnish reload to happen after restart. Delayed notifications are queued up in order. In this case, it makes sense for the reload to happen after the restart.

- Switch from service restart to service reload. The varnish_default_vcl has been updated to perform a service reload instead of a service restart. This will prevent the cache from being cleared when a reload of the vcl file is enough.

v2.1.1
-------------------
- Fixes #56. The apt resource may not be included, so no need to run a notification on it.

v1.2.0
-------------------

- Make resource_name compatible with older Chef. Switch from passing an argument into resource_name to using the assignment operator '='. This will make resource_name compatible with older versions of Chef.

v1.1.0 (2015-02-16)
-------------------
- Created libraries, to eventually replace recipe functionality, currently can be used along side recipes
- Added CircleCI support for automated testing
- Added logrotate support
- Added varnish(log|nsca) support

v0.9.12 (2014-03-12)
--------------------
- [COOK-4368] - Improve documentation to include all attributes


v0.9.10
-------
### Bug
- **[COOK-3531](https://tickets.chef.io/browse/COOK-3531)** - Fix default instance name


v0.9.8
------
### Improvement
- **[COOK-3095](https://tickets.chef.io/browse/COOK-3095)** - Add MiniTest Chef Handler and Test Kitchen

v0.9.6
------
### Bug
- [COOK-2892]: Varnish restarts when vcl is updated instead of reloading

v0.9.4
------
- [COOK-1261] - fix issues with default.vcl handling

v0.9.0
------
- [COOK-873] - full daemon configuration through attributes
- [COOK-1091] - fix path for default.vcl, via COOK-873
- [COOK-1162] - add apt_repo recipe for using official varnish repository

v0.8.0
------
- Current public release.
