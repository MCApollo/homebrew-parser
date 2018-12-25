name :
	 Mongrel2
homepage :
	 https://mongrel2.org/
url :
description :
	 Application, language, and network architecture agnostic web server
build_deps :
link_deps :
	 zeromq
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 ENV["OPTFLAGS"] = "#{ENV.cflags} #{ENV.cppflags}"
	 ENV["OPTLIBS"] = "#{ENV.ldflags} -undefined dynamic_lookup"
	 system "make", "all"
	 system "make", "install", "PREFIX=#{prefix}"
