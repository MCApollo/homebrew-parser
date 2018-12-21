name :
	 R
homepage :
	 https://www.r-project.org/
url :
	 https://cran.r-project.org/src/base/R-3/R-3.5.1.tar.gz
description :
	 Software environment for statistical computing
build_deps :
	 pkg-config
link_deps :
	 gcc
	 gettext
	 jpeg
	 libpng
	 pcre
	 readline
	 xz
	 :java
	 openblas
conflicts :
patches :
EOF_patch :
install :
	 if MacOS.version == "10.11" && MacOS::Xcode.installed? &&
	 MacOS::Xcode.version >= "8.0"
	 ENV["ac_cv_have_decl_clock_gettime"] = "no"
	 short_version =
	 `#{bin}/Rscript -e 'cat(as.character(getRversion()[1,1:2]))'`.strip
	 site_library = HOMEBREW_PREFIX/"lib/R/#{short_version}/site-library"
	 site_library.mkpath
	 ln_s site_library, lib/"R/site-library"
