name :
	 Mono
homepage :
	 https://www.mono-project.com/
url :
	 https://download.mono-project.com/sources/mono/mono-5.14.0.177.tar.bz2
description :
	 Cross platform, open source .NET development framework
build_deps :
	 cmake
	 pkg-config
link_deps :
conflicts :
	 xsd
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --enable-nls=no
	 ]
	 args << "--build=" + (MacOS.prefer_64_bit? ? "x86_64": "i686") + "-apple-darwin"
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 libexec.install bin/"mono-gdb.py", bin/"mono-sgen-gdb.py"
	 ENV.prepend_path "PATH", bin
	 resource("msbuild").stage do
	 system "./build.sh", "-hostType", "mono", "-configuration", "Release", "-skipTests"
	 system "./artifacts/mono-msbuild/msbuild", "mono/build/install.proj",
	 "/p:MonoInstallPrefix=#{prefix}", "/p:Configuration=Release-MONO",
	 "/p:IgnoreDiffFailure=true"
