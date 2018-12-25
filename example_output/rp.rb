name :
	 Rp
homepage :
	 https://0vercl0k.github.io/rp/
url :
	 https://github.com/0vercl0k/rp/archive/v1.tar.gz
description :
	 Tool to find ROP sequences in PE/Elf/Mach-O x86/x64 binaries
build_deps :
	 cmake
link_deps :
	 :macos
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/CMakeLists.txt b/CMakeLists.txt
	 index 79d576b..34c2afa 100644
	 --- a/CMakeLists.txt
	 +++ b/CMakeLists.txt
	 @@ -36,12 +36,10 @@ set(RP_NAME "${RP_NAME}-${RP_PLAT}")
	 if(CMAKE_SIZEOF_VOID_P EQUAL 8 AND NOT(optX86BUILD))
	 set(FLAG_CXX "-m64")
	 -    set(RP_NAME "${RP_NAME}-x64")
	 set(BEA_LIBRARY "BeaEngine.x64.${RP_PLAT}.${EXTENSION_LIBRARY}")
	 set(ARGTABLE_LIBRARY "argtable2.x64.${RP_PLAT}.${EXTENSION_LIBRARY}")
	 else()
	 set(FLAG_CXX "-m32")
	 -    set(RP_NAME "${RP_NAME}-x86")
	 set(BEA_LIBRARY "BeaEngine.x86.${RP_PLAT}.${EXTENSION_LIBRARY}")
	 set(ARGTABLE_LIBRARY "argtable2.x86.${RP_PLAT}.${EXTENSION_LIBRARY}")
	 endif(CMAKE_SIZEOF_VOID_P EQUAL 8 AND NOT(optX86BUILD))
install :
	 mkdir "build" do
	 system "cmake", ".."
	 system "make"
	 end
	 bin.install "bin/rp-osx"
