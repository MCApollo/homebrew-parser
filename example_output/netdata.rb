name :
	 Netdata
homepage :
	 https://my-netdata.io/
url :
	 https://github.com/netdata/netdata/releases/download/v1.11.1/netdata-v1.11.1.tar.gz
description :
	 Distributed real-time performance and health monitoring
build_deps :
	 autoconf
	 automake
	 pkg-config
link_deps :
	 ossp-uuid
optional_deps :
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
	 "--sysconfdir=#{etc}",
	 "--localstatedir=#{var}"
	 system "make", "install"
	 (etc/"netdata").install "system/netdata.conf"
	 config = etc/"netdata/netdata.conf"
	 inreplace config do |s|
	 s.gsub!(/web files owner = .*/, "web files owner = #{ENV["USER"]}")
	 s.gsub!(/web files group = .*/, "web files group = #{Etc.getgrgid(prefix.stat.gid).name}")
	 end
