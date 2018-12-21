name :
	 Openttd
homepage :
	 https://www.openttd.org/
url :
	 https://binaries.openttd.org/releases/1.8.0/openttd-1.8.0-source.tar.xz
description :
	 Simulation game based upon Transport Tycoon Deluxe
build_deps :
	 pkg-config
link_deps :
	 lzo
	 xz
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix-dir=#{prefix}"
	 system "make", "bundle"
	 (buildpath/"bundle/OpenTTD.app/Contents/Resources/data/opengfx").install resource("opengfx")
	 (buildpath/"bundle/OpenTTD.app/Contents/Resources/data/opensfx").install resource("opensfx")
	 (buildpath/"bundle/OpenTTD.app/Contents/Resources/gm/openmsx").install resource("openmsx")
	 prefix.install "bundle/OpenTTD.app"
	 bin.write_exec_script "#{prefix}/OpenTTD.app/Contents/MacOS/openttd"
