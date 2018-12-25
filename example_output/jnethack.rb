name :
	 Jnethack
homepage :
	 https://jnethack.osdn.jp/
url :
	 https://downloads.sourceforge.net/project/nethack/nethack/3.4.3/nethack-343-src.tgz
description :
	 Japanese localization of Nethack
build_deps :
link_deps :
	 :x11
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://dotsrc.dl.osdn.net/osdn/jnethack/58545/jnethack-3.4.3-0.11.diff.gz
	 https://raw.githubusercontent.com/Homebrew/formula-patches/e9653f1/jnethack/3.4.3-0.11.patch
EOF_patch :
install :
	 ENV.deparallelize
	 ENV["HOMEBREW_CFLAGS"] = ENV.cflags
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
	 end
	 libexec.install %w[jhelp jhh jcmdhelp jhistory jopthelp jwizhelp dungeon license data jdata.base joracles options jrumors.tru jrumors.fal quest.dat jquest.txt]
	 libexec.install Dir["*.lev"]
	 end
	 ENV.append_to_cflags "-I../include"
	 cd "src" do
	 system "make"
	 end
	 bin.install "src/jnethack"
	 (libexec+"save").mkpath
