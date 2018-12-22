name :
	 Ooniprobe
homepage :
	 https://ooni.torproject.org/
url :
	 https://files.pythonhosted.org/packages/d8/c0/b4a2ae442dd95160a75251110313d1f9b22834a76ef9bd8f70603b4a867a/ooniprobe-2.3.0.tar.gz
description :
	 Network interference detection tool
build_deps :
link_deps :
	 geoip
	 libdnet
	 libyaml
	 openssl
	 python@2
	 tor
conflicts :
patches :
	 https://github.com/pynetwork/pypcap/pull/79.patch?full_index=1
EOF_patch :
install :
	 inreplace "requirements.txt", "pydumbnet", ""
	 inreplace "setup.py", "def run(", "def norun("
	 inreplace "ooni/settings.py", /(IS_VIRTUALENV = ).*/, "\\1 False"
	 (buildpath/"ooni/settings.ini").atomic_write <<~EOS
	 [directories]
	 usr_share = #{pkgshare}
	 var_lib = #{var}/lib/ooni
	 etc = #{etc}/ooni
	 EOS
	 if MacOS.sdk_path_if_needed
	 ENV.append "CPPFLAGS", "-I#{MacOS.sdk_path}/usr/include/ffi"
	 end
	 virtualenv_install_with_resources
	 man1.install Dir["data/*.1"]
	 pkgshare.install Dir["data/*"]
	 return if (pkgshare/"decks-available").exist?
	 ln_s pkgshare/"decks", pkgshare/"decks-available"
	 ln_s pkgshare/"decks/web.yaml", pkgshare/"current.deck"
