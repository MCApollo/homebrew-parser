name :
	 Ruby
	 
homepage :
	 https://www.ruby-lang.org/
url :
	 https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.3.tar.xz
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
	 ['rubygems']
	 ['https://rubygems.org/rubygems/rubygems-2.7.7.tgz']
patches :
EOF_patch :
install :
	 ENV.delete("SDKROOT")
	 system "autoconf" if build.head?
	 paths = %w[libyaml openssl readline].map { |f| Formula[f].opt_prefix }
	 args = %W[
	 --prefix=#{prefix}
	 --enable-shared
	 --disable-silent-rules
	 --with-sitedir=#{HOMEBREW_PREFIX}/lib/ruby/site_ruby
	 --with-vendordir=#{HOMEBREW_PREFIX}/lib/ruby/vendor_ruby
	 --with-opt-dir=#{paths.join(":")}
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
	 elisp.install Dir["misc/*.el"].reject { |f| f == "misc/ruby-mode.el" }
	 resource("rubygems").stage do
	 ENV.prepend_path "PATH", bin
	 system "#{bin}/ruby", "setup.rb", "--prefix=#{buildpath}/vendor_gem"
	 rg_in = lib/"ruby/#{api_version}"
	 rm_rf rg_in/"rubygems"
	 rm_f rg_in/"rubygems.rb"
	 rm_f rg_in/"ubygems.rb"
	 rm_f bin/"gem"
	 rg_in.install Dir[buildpath/"vendor_gem/lib/*"]
	 bin.install buildpath/"vendor_gem/bin/gem" => "gem"
	 (libexec/"gembin").install buildpath/"vendor_gem/bin/bundle" => "bundle"
	 (libexec/"gembin").install_symlink "bundle" => "bundler"
	 end
	 rm_f %W[
	 #{rubygems_bindir}/bundle
	 #{rubygems_bindir}/bundler
	 ]
	 rm_rf Dir[HOMEBREW_PREFIX/"lib/ruby/gems/#{api_version}/gems/bundler-*"]
	 rubygems_bindir.install_symlink Dir[libexec/"gembin/*"]
	 config_file = lib/"ruby/#{api_version}/rubygems/defaults/operating_system.rb"
	 config_file.unlink if config_file.exist?
	 config_file.write rubygems_config(api_version)
	 %w[sitearchdir vendorarchdir].each do |dir|
	 mkdir_p `#{bin}/ruby -rrbconfig -e 'print RbConfig::CONFIG["#{dir}"]'`
	 end
