name :
	 Ghostscript
homepage :
	 https://www.ghostscript.com/
url :
	 https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs926/ghostpdl-9.26.tar.xz
description :
	 Interpreter for PostScript and PDF
build_deps :
	 pkg-config
link_deps :
	 libtiff
optional_deps :
	 :x11
conflicts :
resource :
	 ['fonts']
	 ['https://downloads.sourceforge.net/project/gs-fonts/gs-fonts/8.11%20%28base%2035%2C%20GPL%29/ghostscript-fonts-std-8.11.tar.gz']
patches :
EOF_patch :
	 diff --git i/base/unix-dll.mak w/base/unix-dll.mak
	 index f50c09c00adb..8855133b400c 100644
	 --- i/base/unix-dll.mak
	 +++ w/base/unix-dll.mak
	 @@ -89,18 +89,33 @@ GPDL_SONAME_MAJOR_MINOR=$(GPDL_SONAME_BASE)$(GS_SOEXT)$(SO_LIB_VERSION_SEPARATOR
	 -#GS_SOEXT=dylib
	 -#GS_SONAME=$(GS_SONAME_BASE).$(GS_SOEXT)
	 -#GS_SONAME_MAJOR=$(GS_SONAME_BASE).$(GS_VERSION_MAJOR).$(GS_SOEXT)
	 -#GS_SONAME_MAJOR_MINOR=$(GS_SONAME_BASE).$(GS_VERSION_MAJOR).$(GS_VERSION_MINOR).$(GS_SOEXT)
	 +GS_SOEXT=dylib
	 +GS_SONAME=$(GS_SONAME_BASE).$(GS_SOEXT)
	 +GS_SONAME_MAJOR=$(GS_SONAME_BASE).$(GS_VERSION_MAJOR).$(GS_SOEXT)
	 +GS_SONAME_MAJOR_MINOR=$(GS_SONAME_BASE).$(GS_VERSION_MAJOR).$(GS_VERSION_MINOR).$(GS_SOEXT)
	 #LDFLAGS_SO=-dynamiclib -flat_namespace
	 -#LDFLAGS_SO_MAC=-dynamiclib -install_name $(GS_SONAME_MAJOR_MINOR)
	 +GS_LDFLAGS_SO=-dynamiclib -install_name $(GS_SONAME_MAJOR_MINOR)
	 #LDFLAGS_SO=-dynamiclib -install_name $(FRAMEWORK_NAME)
	 +PCL_SONAME=$(PCL_SONAME_BASE).$(GS_SOEXT)
	 +PCL_SONAME_MAJOR=$(PCL_SONAME_BASE).$(GS_VERSION_MAJOR).$(GS_SOEXT)
	 +PCL_SONAME_MAJOR_MINOR=$(PCL_SONAME_BASE).$(GS_VERSION_MAJOR).$(GS_VERSION_MINOR).$(GS_SOEXT)
	 +PCL_LDFLAGS_SO=-dynamiclib -install_name $(PCL_SONAME_MAJOR_MINOR)
	 +
	 +XPS_SONAME=$(XPS_SONAME_BASE).$(GS_SOEXT)
	 +XPS_SONAME_MAJOR=$(XPS_SONAME_BASE).$(GS_VERSION_MAJOR).$(GS_SOEXT)
	 +XPS_SONAME_MAJOR_MINOR=$(XPS_SONAME_BASE).$(GS_VERSION_MAJOR).$(GS_VERSION_MINOR).$(GS_SOEXT)
	 +XPS_LDFLAGS_SO=-dynamiclib -install_name $(XPS_SONAME_MAJOR_MINOR)
	 +
	 +GPDL_SONAME=$(GPDL_SONAME_BASE).$(GS_SOEXT)
	 +GPDL_SONAME_MAJOR=$(GPDL_SONAME_BASE).$(GS_VERSION_MAJOR).$(GS_SOEXT)
	 +GPDL_SONAME_MAJOR_MINOR=$(GPDL_SONAME_BASE).$(GS_VERSION_MAJOR).$(GS_VERSION_MINOR).$(GS_SOEXT)
	 +GPDL_LDFLAGS_SO=-dynamiclib -install_name $(GPDL_SONAME_MAJOR_MINOR)
	 +
	 GS_SO=$(BINDIR)/$(GS_SONAME)
	 GS_SO_MAJOR=$(BINDIR)/$(GS_SONAME_MAJOR)
	 GS_SO_MAJOR_MINOR=$(BINDIR)/$(GS_SONAME_MAJOR_MINOR)
	 PCL_SO=$(BINDIR)/$(PCL_SONAME)
install :
	 args = %W[
	 --prefix=#{prefix}
	 --disable-cups
	 --disable-compile-inits
	 --disable-gtk
	 --disable-fontconfig
	 --without-libidn
	 --with-system-libtiff
	 ]
	 args << "--without-x" if build.without? "x11"
	 if build.head?
	 system "./autogen.sh", *args
	 else
	 system "./configure", *args
	 end
	 system "make", "install"
	 system "make", "install-so"
	 (pkgshare/"fonts").install resource("fonts")
	 (man/"de").rmtree
