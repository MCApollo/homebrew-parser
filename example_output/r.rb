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
	 end
	 args = [
	 "--prefix=#{prefix}",
	 "--enable-memory-profiling",
	 "--without-cairo",
	 "--without-x",
	 "--with-aqua",
	 "--with-lapack",
	 "--enable-R-shlib",
	 "SED=/usr/bin/sed",
	 ]
	 if build.with? "openblas"
	 args << "--with-blas=-L#{Formula["openblas"].opt_lib} -lopenblas"
	 ENV.append "LDFLAGS", "-L#{Formula["openblas"].opt_lib}"
	 else
	 args << "--with-blas=-framework Accelerate"
	 ENV.append_to_cflags "-D__ACCELERATE__" if ENV.compiler != :clang
	 end
	 if build.with? "java"
	 args << "--enable-java"
	 else
	 args << "--disable-java"
	 end
	 ["gettext", "readline"].each do |f|
	 ENV.append "CPPFLAGS", "-I#{Formula[f].opt_include}"
	 ENV.append "LDFLAGS", "-L#{Formula[f].opt_lib}"
	 end
	 system "./configure", *args
	 system "make"
	 ENV.deparallelize do
	 system "make", "install"
	 end
	 cd "src/nmath/standalone" do
	 system "make"
	 ENV.deparallelize do
	 system "make", "install"
	 end
	 end
	 r_home = lib/"R"
	 inreplace r_home/"etc/Makeconf" do |s|
	 s.gsub!(/^CPPFLAGS =.*/, "\\0 -I#{HOMEBREW_PREFIX}/include")
	 s.gsub!(/^LDFLAGS =.*/, "\\0 -L#{HOMEBREW_PREFIX}/lib")
	 s.gsub!(/.LDFLAGS =.*/, "\\0 $(LDFLAGS)")
	 end
	 include.install_symlink Dir[r_home/"include/*"]
	 lib.install_symlink Dir[r_home/"lib/*"]
	 inreplace lib/"R/etc/Makeconf", Formula["gcc"].prefix.realpath,
	 Formula["gcc"].opt_prefix
	 short_version =
	 `#{bin}/Rscript -e 'cat(as.character(getRversion()[1,1:2]))'`.strip
	 site_library = HOMEBREW_PREFIX/"lib/R/#{short_version}/site-library"
	 site_library.mkpath
	 ln_s site_library, lib/"R/site-library"
