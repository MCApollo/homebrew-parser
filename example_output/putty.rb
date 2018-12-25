name :
	 Putty
homepage :
	 https://www.chiark.greenend.org.uk/~sgtatham/putty/
url :
	 https://the.earth.li/~sgtatham/putty/0.70/putty-0.70.tar.gz
description :
	 Implementation of Telnet and SSH
build_deps :
	 pkg-config
link_deps :
optional_deps :
conflicts :
	 pssh
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if build.head?
	 system "./mkfiles.pl"
	 system "./mkauto.sh"
	 system "make", "-C", "doc"
	 end
	 args = %W[
	 --prefix=#{prefix}
	 --disable-silent-rules
	 --disable-dependency-tracking
	 --disable-gtktest
	 ]
	 if build.head? && build.with?("gtk+3")
	 args << "--with-gtk=3" << "--with-quartz"
	 else
	 args << "--without-gtk"
	 end
	 system "./configure", *args
	 build_version = build.head? ? "svn-#{version}" : version
	 system "make", "VER=-DRELEASE=#{build_version}"
	 bin.install %w[plink pscp psftp puttygen]
	 bin.install %w[putty puttytel pterm] if build.head? && build.with?("gtk+3")
	 cd "doc" do
	 man1.install %w[plink.1 pscp.1 psftp.1 puttygen.1]
	 man1.install %w[putty.1 puttytel.1 pterm.1] if build.head? && build.with?("gtk+3")
	 end
