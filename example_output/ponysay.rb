name :
	 Ponysay
homepage :
	 https://erkin.co/ponysay/
url :
	 https://github.com/erkin/ponysay/archive/3.0.3.tar.gz
description :
	 Cowsay but with ponies
build_deps :
link_deps :
	 coreutils
	 python
conflicts :
patches :
EOF_patch :
install :
	 system "./setup.py",
	 "--freedom=partial",
	 "--prefix=#{prefix}",
	 "--cache-dir=#{prefix}/var/cache",
	 "--sysconf-dir=#{prefix}/etc",
	 "install"
