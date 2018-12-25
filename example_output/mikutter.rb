name :
	 Mikutter
	 Post
homepage :
	 https://mikutter.hachune.net/
url :
	 https://mikutter.hachune.net/bin/mikutter.3.7.4.tar.gz
description :
	 Extensible Twitter client
build_deps :
link_deps :
	 gobject-introspection
	 gtk+
	 libidn
	 ruby
	 terminal-notifier
optional_deps :
conflicts :
resource :
	 ['addressable', 'atk', 'cairo', 'cairo-gobject', 'delayer', 'delayer-deferred', 'diva', 'gdk_pixbuf2', 'gettext', 'gio2', 'glib2', 'gobject-introspection', 'gtk2', 'httpclient', 'idn-ruby', 'instance_storage', 'json_pure', 'locale', 'memoist', 'mini_portile2', 'moneta', 'native-package-installer', 'nokogiri', 'oauth', 'pango', 'pkg-config', 'pluggaloid', 'public_suffix', 'ruby-hmac', 'text', 'totoridipjp', 'twitter-text', 'typed-array', 'unf', 'unf_ext']
	 ['https://rubygems.org/gems/addressable-2.5.2.gem', 'https://rubygems.org/gems/atk-3.2.1.gem', 'https://rubygems.org/gems/cairo-1.15.13.gem', 'https://rubygems.org/gems/cairo-gobject-3.2.1.gem', 'https://rubygems.org/gems/delayer-0.0.2.gem', 'https://rubygems.org/gems/delayer-deferred-2.0.0.gem', 'https://rubygems.org/gems/diva-0.3.2.gem', 'https://rubygems.org/gems/gdk_pixbuf2-3.2.1.gem', 'https://rubygems.org/gems/gettext-3.0.9.gem', 'https://rubygems.org/gems/gio2-3.2.1.gem', 'https://rubygems.org/gems/glib2-3.2.1.gem', 'https://rubygems.org/gems/gobject-introspection-3.2.1.gem', 'https://rubygems.org/gems/gtk2-3.2.1.gem', 'https://rubygems.org/gems/httpclient-2.8.3.gem', 'https://rubygems.org/gems/idn-ruby-0.1.0.gem', 'https://rubygems.org/gems/instance_storage-1.0.0.gem', 'https://rubygems.org/gems/json_pure-1.8.6.gem', 'https://rubygems.org/gems/locale-2.1.2.gem', 'https://rubygems.org/gems/memoist-0.16.0.gem', 'https://rubygems.org/gems/mini_portile2-2.3.0.gem', 'https://rubygems.org/gems/moneta-1.0.0.gem', 'https://rubygems.org/gems/native-package-installer-1.0.6.gem', 'https://rubygems.org/gems/nokogiri-1.8.4.gem', 'https://rubygems.org/gems/oauth-0.5.4.gem', 'https://rubygems.org/gems/pango-3.2.1.gem', 'https://rubygems.org/gems/pkg-config-1.3.1.gem', 'https://rubygems.org/gems/pluggaloid-1.1.1.gem', 'https://rubygems.org/gems/public_suffix-3.0.2.gem', 'https://rubygems.org/gems/ruby-hmac-0.4.0.gem', 'https://rubygems.org/gems/text-1.3.1.gem', 'https://rubygems.org/gems/totoridipjp-0.1.0.gem', 'https://rubygems.org/gems/twitter-text-2.1.0.gem', 'https://rubygems.org/gems/typed-array-0.1.2.gem', 'https://rubygems.org/gems/unf-0.1.4.gem', 'https://rubygems.org/gems/unf_ext-0.0.7.5.gem']
patches :
EOF_patch :
install :
	 (lib/"mikutter/vendor").mkpath
	 resources.each do |r|
	 r.verify_download_integrity(r.fetch)
	 system("gem", "install", r.cached_download, "--no-document",
	 "--install-dir", "#{lib}/mikutter/vendor")
	 end
	 rm_rf "vendor"
	 (lib/"mikutter").install "plugin"
	 libexec.install Dir["*"]
	 (bin/"mikutter").write(exec_script)
	 pkgshare.install_symlink libexec/"core/skin"
	 libexec.install_symlink HOMEBREW_PREFIX/"lib/mikutter/plugin"
