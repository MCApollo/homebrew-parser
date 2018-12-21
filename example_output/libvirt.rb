name :
	 Libvirt
homepage :
	 https://www.libvirt.org
url :
	 https://libvirt.org/sources/libvirt-4.10.0.tar.xz
description :
	 C virtualization API
build_deps :
	 pkg-config
	 autoconf
	 automake
	 gettext
	 libtool
	 rpcgen
link_deps :
	 gnutls
	 libgcrypt
	 yajl
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --localstatedir=#{var}
	 --mandir=#{man}
	 --sysconfdir=#{etc}
	 --with-esx
	 --with-init-script=none
	 --with-remote
	 --with-test
	 --with-vbox
	 --with-vmware
	 --with-qemu
	 ]
	 args << "ac_cv_path_RPCGEN=#{Formula["rpcgen"].opt_prefix}/bin/rpcgen" if build.head?
	 system "./autogen.sh" if build.head?
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 inreplace "#{etc}/sasl2/libvirt.conf", "/etc/", "#{HOMEBREW_PREFIX}/etc/"
	 inreplace "#{etc}/libvirt/libvirtd.conf" do |s|
	 s.gsub! "/etc/", "#{HOMEBREW_PREFIX}/etc/"
	 s.gsub! "/var/", "#{HOMEBREW_PREFIX}/var/"
