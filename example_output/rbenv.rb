name :
	 Rbenv
homepage :
	 https://github.com/rbenv/rbenv#readme
url :
	 https://github.com/rbenv/rbenv/archive/v1.1.1.tar.gz
description :
	 Ruby version manager
build_deps :
link_deps :
	 ruby-build
conflicts :
patches :
EOF_patch :
install :
	 inreplace "libexec/rbenv" do |s|
	 s.gsub! '"${BASH_SOURCE%/*}"/../libexec', libexec
	 if HOMEBREW_PREFIX.to_s != "/usr/local"
	 s.gsub! ":/usr/local/etc/rbenv.d", ":#{HOMEBREW_PREFIX}/etc/rbenv.d\\0"
