name :
	 Minbif
homepage :
	 https://symlink.me/projects/minbif/wiki/
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/m/minbif/minbif_1.0.5+git20150505.orig.tar.gz
description :
	 IRC-to-other-IM-networks gateway using Pidgin library
build_deps :
	 cmake
	 pkg-config
link_deps :
	 gettext
	 glib
	 gnutls
	 pidgin
conflicts :
patches :
EOF_patch :
install :
	 inreplace "minbif.conf" do |s|
	 s.gsub! "users = /var", "users = #{var}"
	 s.gsub! "motd = /etc", "motd = #{etc}"
	 end
	 system "make", "PREFIX=#{prefix}",
	 "ENABLE_CACA=OFF",
	 "ENABLE_IMLIB=OFF",
	 "ENABLE_MINBIF=ON",
	 "ENABLE_PAM=OFF",
	 "ENABLE_PLUGIN=ON",
	 "ENABLE_TLS=ON",
	 "ENABLE_VIDEO=OFF"
	 system "make", "install"
	 (var/"lib/minbif/users").mkpath
