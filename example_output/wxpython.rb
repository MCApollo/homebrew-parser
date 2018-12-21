name :
	 Wxpython
homepage :
	 https://www.wxwidgets.org/
url :
	 https://downloads.sourceforge.net/project/wxpython/wxPython/3.0.2.0/wxPython-src-3.0.2.0.tar.bz2
description :
	 Python bindings for wxWidgets
build_deps :
link_deps :
	 python@2
	 wxmac
conflicts :
patches :
EOF_patch :
install :
	 ENV["WXWIN"] = buildpath
	 ENV.append_to_cflags "-arch #{MacOS.preferred_arch}"
	 inreplace %w[wxPython/config.py wxPython/wx/build/config.py],
	 "WXPREFIX +", "'#{prefix}' +"
	 args = [
	 "WXPORT=osx_cocoa",
	 "WX_CONFIG=#{Formula["wxmac"].opt_bin}/wx-config",
	 "UNICODE=1",
	 "INSTALL_MULTIVERSION=1",
	 "BUILD_GLCANVAS=1",
	 "BUILD_GIZMOS=1",
	 "BUILD_STC=1",
	 ]
	 cd "wxPython" do
	 system "python", "setup.py", "install", "--prefix=#{prefix}", *args
