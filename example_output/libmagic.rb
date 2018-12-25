name :
	 Libmagic
homepage :
	 https://www.darwinsys.com/file/
url :
	 ftp://ftp.astron.com/pub/file/file-5.35.tar.gz
description :
	 Implementation of the file(1) command
build_deps :
link_deps :
optional_deps :
	 python@2
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--enable-fsect-man5",
	 "--enable-static"
	 system "make", "install"
	 (share+"misc/magic").install Dir["magic/Magdir/*"]
	 if build.with? "python@2"
	 cd "python" do
	 system "python", *Language::Python.setup_install_args(prefix)
	 end
	 end
	 rm bin/"file"
	 rm man1/"file.1"
