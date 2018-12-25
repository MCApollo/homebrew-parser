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
optional_deps :
conflicts :
resource :
	 ['opengfx', 'opensfx', 'openmsx']
	 ['https://bundles.openttdcoop.org/opengfx/releases/0.5.4/opengfx-0.5.4.zip', 'https://bundles.openttdcoop.org/opensfx/releases/0.2.3/opensfx-0.2.3.zip', 'https://bundles.openttdcoop.org/openmsx/releases/0.3.1/openmsx-0.3.1.zip']
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
