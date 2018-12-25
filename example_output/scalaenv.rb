name :
	 Scalaenv
homepage :
	 https://github.com/scalaenv/scalaenv
url :
	 https://github.com/scalaenv/scalaenv/archive/version/0.1.2.tar.gz
description :
	 Command-line tool to manage Scala environments
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 var_lib = HOMEBREW_PREFIX/"var/lib/scalaenv"
	 %w[plugins versions].each do |dir|
	 var_dir = "#{var_lib}/#{dir}"
	 mkdir_p var_dir
	 ln_sf var_dir, "#{prefix}/#{dir}"
	 end
	 (var_lib/"plugins").install_symlink "#{prefix}/default-plugins/scala-install"
