name :
	 Libxml2
homepage :
	 http://xmlsoft.org/
url :
	 http://xmlsoft.org/sources/libxml2-2.9.8.tar.gz
description :
	 GNOME XML library
build_deps :
link_deps :
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv" if build.head?
	 inreplace "configure", "-Wno-array-bounds", "" if ENV.compiler == :gcc_4_2
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--without-python",
	 "--without-lzma"
	 system "make", "install"
	 cd "python" do
	 inreplace "setup.py", "includes_dir = [", "includes_dir = ['#{include}', '#{MacOS.sdk_path}/usr/include',"
	 system "python", "setup.py", "install", "--prefix=#{prefix}"
