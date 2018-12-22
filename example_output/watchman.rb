name :
	 Watchman
homepage :
	 https://github.com/facebook/watchman
url :
description :
	 Watch files and take action when they change
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 :macos
	 openssl
	 pcre
	 python
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-pcre",
	 "--without-python",
	 "--enable-statedir=#{var}/run/watchman"
	 system "make"
	 system "make", "install"
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
	 cd "python" do
	 system "python3", *Language::Python.setup_install_args(libexec)
	 end
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
	 (var/"run/watchman").mkpath
	 chmod 042777, var/"run/watchman"
	 home = ENV["HOME"]
	 system "launchctl", "unload",
	 "-F", "#{home}/Library/LaunchAgents/com.github.facebook.watchman.plist"
