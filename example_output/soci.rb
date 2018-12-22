name :
	 Soci
homepage :
	 https://soci.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/soci/soci/soci-3.2.3/soci-3.2.3.zip
description :
	 Database access library for C++
build_deps :
	 cmake
link_deps :
	 boost
	 sqlite
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args + %w[.. -DWITH_SQLITE3:BOOL=ON]
	 %w[boost mysql oracle odbc pg].each do |arg|
	 arg_var = (arg == "pg") ? "postgresql" : arg
	 bool = build.with?(arg) ? "ON" : "OFF"
	 args << "-DWITH_#{arg_var.upcase}:BOOL=#{bool}"
	 end
	 mkdir "build" do
	 system "cmake", *args
	 system "make", "install"
	 end
