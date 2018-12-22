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
conflicts :
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
