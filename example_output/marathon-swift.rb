name :
	 MarathonSwift
homepage :
	 https://github.com/JohnSundell/Marathon
url :
	 https://github.com/JohnSundell/Marathon/archive/1.0.1.tar.gz
description :
	 Makes it easy to write, run and manage your Swift scripts
build_deps :
link_deps :
	 :xcode
conflicts :
patches :
EOF_patch :
install :
	 if MacOS::Xcode.version >= "9.0"
	 system "swift", "package", "--disable-sandbox", "update"
	 system "swift", "build", "-c", "release", "-Xswiftc", "-static-stdlib",
	 "--disable-sandbox"
	 else
	 ENV.delete("CC")
	 system "swift", "package", "update"
	 system "swift", "build", "-c", "release", "-Xswiftc", "-static-stdlib"
	 end
	 system "make", "install_bin", "PREFIX=#{prefix}"
