name :
	 RubyAT20
	 
homepage :
	 https://www.ruby-lang.org/
url :
	 https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p648.tar.bz2
description :
	 Powerful, clean, object-oriented scripting language
build_deps :
	 pkg-config
link_deps :
	 libyaml
	 openssl
	 readline
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 paths = %w[libyaml openssl readline].map { |f| Formula[f].opt_prefix }
	 args = %W[
	 --prefix=#{prefix}
	 --enable-shared
	 --with-sitedir=#{HOMEBREW_PREFIX}/lib/ruby/site_ruby
	 --with-vendordir=#{HOMEBREW_PREFIX}/lib/ruby/vendor_ruby
	 --with-opt-dir=#{paths.join(":")}
	 --with-out-ext=tk
	 ]
	 args << "--disable-dtrace" unless MacOS::CLT.installed?
	 system "./configure", *args
	 #
	 inreplace "tool/rbinstall.rb" do |s|
	 s.gsub! 'prepare "extension scripts", sitelibdir', ""
	 s.gsub! 'prepare "extension scripts", vendorlibdir', ""
	 s.gsub! 'prepare "extension objects", sitearchlibdir', ""
	 s.gsub! 'prepare "extension objects", vendorarchlibdir', ""
	 end
	 system "make"
	 system "make", "install"
	 rm_f %W[
	 #{rubygems_bindir}/bundle
	 #{rubygems_bindir}/bundler
	 ]
	 rm_rf Dir[HOMEBREW_PREFIX/"lib/ruby/gems/#{api_version}/gems/bundler-*"]
	 rubygems_bindir.install_symlink Dir[libexec/"gembin/*"]
	 config_file = lib/"ruby/#{api_version}/rubygems/defaults/operating_system.rb"
	 config_file.unlink if config_file.exist?
	 config_file.write rubygems_config
	 %w[sitearchdir vendorarchdir].each do |dir|
	 mkdir_p `#{bin}/ruby -rrbconfig -e 'print RbConfig::CONFIG["#{dir}"]'`
	 end
