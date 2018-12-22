name :
	 Freeling
homepage :
	 http://nlp.lsi.upc.edu/freeling/
url :
	 https://github.com/TALP-UPC/FreeLing/releases/download/4.1/FreeLing-4.1.tar.gz
description :
	 Suite of language analyzers
build_deps :
	 cmake
link_deps :
	 icu4c
conflicts :
	 hunspell
patches :
EOF_patch :
install :
	 resource("boost").stage do
	 open("user-config.jam", "a") do |file|
	 file.write "using darwin : : #{ENV.cxx} ;\n"
	 end
	 bootstrap_args = %W[
	 --prefix=#{libexec}/boost
	 --libdir=#{libexec}/boost/lib
	 --with-icu=#{Formula["icu4c"].opt_prefix}
	 --with-libraries=atomic,chrono,date_time,filesystem,program_options,regex,system,thread
	 ]
	 args = %W[
	 --prefix=#{libexec}/boost
	 --libdir=#{libexec}/boost/lib
	 -d2
	 -j#{ENV.make_jobs}
	 --ignore-site-config
	 --layout=tagged
	 --user-config=user-config.jam
	 install
	 threading=multi
	 link=shared
	 optimization=space
	 variant=release
	 cxxflags=-std=c++11
	 ]
	 if ENV.compiler == :clang
	 args << "cxxflags=-stdlib=libc++" << "linkflags=-stdlib=libc++"
	 end
	 system "./bootstrap.sh", *bootstrap_args
	 system "./b2", "headers"
	 system "./b2", *args
