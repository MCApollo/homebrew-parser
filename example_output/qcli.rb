name :
	 Qcli
homepage :
	 https://bavc.org/preserve-media/preservation-tools
url :
	 https://github.com/bavc/qctools/archive/v1.0.tar.gz
description :
	 Report audiovisual metrics via libavfilter
build_deps :
	 pkg-config
link_deps :
	 ffmpeg
	 qt
	 qwt
conflicts :
patches :
EOF_patch :
install :
	 ENV["QCTOOLS_USE_BREW"]="true"
	 cd "Project/QtCreator/qctools-lib" do
	 system "qmake", "qctools-lib.pro"
	 system "make"
	 end
	 cd "Project/QtCreator/qctools-cli" do
	 system "qmake", "qctools-cli.pro"
	 system "make"
	 bin.install "qcli"
	 end
