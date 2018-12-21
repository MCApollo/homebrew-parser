name :
	 Wine
homepage :
	 https://www.winehq.org/
url :
	 https://dl.winehq.org/wine/source/3.0/wine-3.0.4.tar.xz
description :
	 Run Windows applications without a copy of Microsoft Windows
build_deps :
	 cmake
	 makedepend
	 pkg-config
link_deps :
	 :maximum_macos
	 :maximum_macos
	 :macos
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/74c2566/wine/2.14.patch
EOF_patch :
install :
	 if DevelopmentTools.clang_build_version >= 1000
	 odie <<~EOS
	 Wine cannot currently be installed from source on
	 macOS #{MacOS.version}.
	 You may wish to try:
	 brew install wine --force-bottle
	 EOS
	 ohai "Regenerating font cache, this may take a while"
	 system "#{libexec}/bin/fc-cache", "-frv"
	 (var/"db/net-snmp_vendored_wine").mkpath
	 (var/"log").mkpath
