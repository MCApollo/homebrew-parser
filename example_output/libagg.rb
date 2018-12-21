name :
	 Libagg
homepage :
	 http://www.antigrain.com/
url :
	 http://www.antigrain.com/agg-2.5.tar.gz
description :
	 High fidelity 2D graphics library for C++
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 sdl
conflicts :
patches :
EOF_patch :
	 diff --git a/include/agg_renderer_outline_aa.h b/include/agg_renderer_outline_aa.h
	 index ce25a2e..9a12d35 100644
	 --- a/include/agg_renderer_outline_aa.h
	 +++ b/include/agg_renderer_outline_aa.h
	 @@ -1375,7 +1375,7 @@ namespace agg
	 //---------------------------------------------------------------------
	 void profile(const line_profile_aa& prof) { m_profile = &prof; }
	 const line_profile_aa& profile() const { return *m_profile; }
	 -        line_profile_aa& profile() { return *m_profile; }
	 +        const line_profile_aa& profile() { return *m_profile; }
	 //---------------------------------------------------------------------
	 int subpixel_width() const { return m_profile->subpixel_width(); }
install :
	 inreplace "configure.in", "AM_C_PROTOTYPES", ""
	 inreplace "autogen.sh", "libtoolize", "glibtoolize"
	 system "sh", "autogen.sh",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-platform",
	 "--disable-ctrl",
	 "--disable-examples",
	 "--disable-sdltest"
	 system "make", "install"
