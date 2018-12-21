name :
	 Jpcsp
homepage :
	 https://jpcsp.org/
url :
	 9bf0cb72568e4c7170c6c5b0a975e0ff2f5205d1
description :
	 PSP emulator written in Java
build_deps :
	 ant
	 p7zip
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 system "ant", "-f", "build-auto.xml", "dist-macosx"
	 chmod 0755, "dist/jpcsp-macosx/Jpcsp.app/Contents/MacOS/JavaApplicationStub"
	 prefix.install "dist/jpcsp-macosx/Jpcsp.app"
	 bin.write_exec_script "#{prefix}/Jpcsp.app/Contents/MacOS/JavaApplicationStub"
	 mv "#{bin}/JavaApplicationStub", "#{bin}/jpcsp"
