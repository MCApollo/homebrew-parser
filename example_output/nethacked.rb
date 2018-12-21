name :
	 Nethacked
homepage :
	 https://nethacked.github.io/
url :
	 https://github.com/nethacked/nethacked/archive/1.0.tar.gz
description :
	 Bugfixed and interface-patched Nethack
build_deps :
link_deps :
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/b40e459/nethacked/1.0.patch
EOF_patch :
install :
	 ENV.deparallelize
	 system "sh", "sys/unix/setup.sh"
	 inreplace "include/config.h",
	 /^#\s*define HACKDIR.*$/,
	 "#define HACKDIR \"#{libexec}\""
	 wizard = Etc.getpwuid.name
	 inreplace "include/config.h",
	 /^#\s*define\s+WIZARD\s+"wizard"/,
	 "#define WIZARD \"#{wizard}\""
	 inreplace "include/config.h",
	 /^#\s*define\s+WIZARD_NAME\s+"wizard"/,
	 "#define WIZARD_NAME \"#{wizard}\""
	 cd "dat" do
	 system "make"
	 %w[perm logfile].each do |f|
	 touch f
	 libexec.install f
