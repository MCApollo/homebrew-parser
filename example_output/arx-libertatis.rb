name :
	 ArxLibertatis
homepage :
	 https://arx-libertatis.org/
url :
	 https://arx-libertatis.org/files/arx-libertatis-1.1.2.tar.xz
description :
	 Cross-platform, open source port of Arx Fatalis
build_deps :
	 boost
	 cmake
	 glm
link_deps :
	 freetype
	 glew
	 innoextract
	 sdl
optional_deps :
conflicts :
	 rnv
resource :
	 []
	 []
patches :
	 https://github.com/arx/ArxLibertatis/commit/442ba4af978160abd3856a9daec38f5b6e213cb4.patch?full_index=1
EOF_patch :
install :
	 args = std_cmake_args
	 if build.stable?
	 inreplace "src/platform/Time.cpp", "clock_t ", "clockid_t "
	 inreplace "src/core/Version.cpp.in" do |s|
	 s.gsub! "${VERSION_COUNT}", "5"
	 s.gsub! "${VERSION_2}", "10"
	 s.gsub! "${VERSION_0}", "1.1.2"
	 s.gsub! "${GIT_SUFFIX_5}", "+Homebrew-1"
	 s.gsub! "${VERSION_4}", "Rhaa Movis"
	 end
	 end
	 if build.head?
	 (buildpath/"arx-libertatis-data").install resource("arx-libertatis-data")
	 args << "-DDATA_FILES=#{buildpath}/arx-libertatis-data"
	 end
	 mkdir "build" do
	 system "cmake", "..", *args
	 system "make", "install"
	 end
