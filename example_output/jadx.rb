name :
	 Jadx
homepage :
	 https://github.com/skylot/jadx
url :
	 https://github.com/skylot/jadx/releases/download/v0.8.0/jadx-0.8.0.zip
description :
	 Dex to Java decompiler
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 system "gradle", "clean", "dist"
	 libexec.install Dir["build/jadx/*"]
	 else
	 libexec.install Dir["*"]
	 end
	 bin.install_symlink libexec/"bin/jadx"
	 bin.install_symlink libexec/"bin/jadx-gui"
