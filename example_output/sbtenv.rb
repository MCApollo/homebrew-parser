name :
	 Sbtenv
homepage :
	 https://github.com/sbtenv/sbtenv
url :
	 https://github.com/sbtenv/sbtenv/archive/version/0.0.15.tar.gz
description :
	 Command-line tool for managing sbt environments
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 var_lib = HOMEBREW_PREFIX/"var/lib/sbtenv"
	 %w[plugins versions].each do |dir|
	 var_dir = "#{var_lib}/#{dir}"
	 mkdir_p var_dir
	 ln_sf var_dir, "#{prefix}/#{dir}"
