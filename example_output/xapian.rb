name :
	 Xapian
homepage :
	 https://xapian.org/
url :
	 https://oligarchy.co.uk/xapian/1.4.7/xapian-core-1.4.7.tar.xz
description :
	 C++ search engine library with many bindings
build_deps :
link_deps :
	 python@2
	 sphinx-doc
	 ruby
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 if build.with?("ruby") || build.with?("python@2")
	 resource("bindings").stage do
	 ENV["XAPIAN_CONFIG"] = bin/"xapian-config"
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 ]
	 if build.with? "ruby"
	 ruby_site = lib/"ruby/site_ruby"
	 ENV["RUBY_LIB"] = ENV["RUBY_LIB_ARCH"] = ruby_site
	 args << "--with-ruby"
