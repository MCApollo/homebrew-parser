name :
	 Io
homepage :
	 http://iolanguage.com/
url :
	 https://github.com/stevedekorte/io/archive/2017.09.06.tar.gz
description :
	 Small prototype-based programming language
build_deps :
	 cmake
	 pkg-config
link_deps :
	 glib
	 cairo
	 gmp
	 jpeg
	 libevent
	 libffi
	 libogg
	 libpng
	 libsndfile
	 libtiff
	 libvorbis
	 ossp-uuid
	 pcre
	 yajl
	 xz
	 python
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 ENV.append_to_cflags "-fobjc-exceptions"
	 if build.without? "addons"
	 inreplace "CMakeLists.txt", "add_subdirectory(addons)",
	 "#add_subdirectory(addons)"
	 else
	 inreplace "addons/CMakeLists.txt" do |s|
	 if build.without? "python"
	 s.gsub! "add_subdirectory(Python)", "#add_subdirectory(Python)"
	 end
	 s.gsub!(/(add_subdirectory\(Font\))/, '#\1')
	 s.gsub!(/(add_subdirectory\(Memcached\))/, '#\1')
