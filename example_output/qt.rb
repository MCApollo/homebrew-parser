name :
	 Qt
homepage :
	 https://www.qt.io/
url :
	 https://download.qt.io/official_releases/qt/5.12/5.12.0/single/qt-everywhere-src-5.12.0.tar.xz
description :
	 Cross-platform application and UI framework
build_deps :
	 pkg-config
	 :xcode
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 -verbose
	 -prefix #{prefix}
	 -release
	 -opensource -confirm-license
	 -system-zlib
	 -qt-libpng
	 -qt-libjpeg
	 -qt-freetype
	 -qt-pcre
	 -nomake examples
	 -nomake tests
	 -no-rpath
	 -pkg-config
	 -dbus-runtime
	 -proprietary-codecs
	 ]
	 system "./configure", *args
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
	 frameworks.install_symlink Dir["#{lib}/*.framework"]
	 Pathname.glob("#{lib}/*.framework/Headers") do |path|
	 include.install_symlink path => path.parent.basename(".framework")
	 end
	 libexec.mkpath
	 Pathname.glob("#{bin}/*.app") { |app| mv app, libexec }
