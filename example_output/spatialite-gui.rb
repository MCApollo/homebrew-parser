name :
	 SpatialiteGui
homepage :
	 https://www.gaia-gis.it/fossil/spatialite_gui/index
url :
	 https://www.gaia-gis.it/gaia-sins/spatialite-gui-sources/spatialite_gui-1.7.1.tar.gz
description :
	 GUI tool supporting SpatiaLite
build_deps :
	 pkg-config
link_deps :
	 freexl
	 geos
	 libgaiagraphics
	 libspatialite
	 proj
	 sqlite
	 wxmac
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 For some strange reason, wxWidgets does not take the required steps to register
	 programs as GUI apps like other toolkits do. This necessitates the creation of
	 an app bundle on OS X.
	 This clever hack sidesteps the headache of packing simple programs into app
	 bundles:
	 https://www.miscdebris.net/blog/2010/03/30/
	 solution-for-my-mac-os-x-gui-program-doesnt-get-focus-if-its-outside-an-application-bundle
	 ---
	 Main.cpp |   21 +++++++++++++++++++++
	 1 files changed, 21 insertions(+), 0 deletions(-)
	 diff --git a/Main.cpp b/Main.cpp
	 index a857e8a..9c90afb 100644
	 --- a/Main.cpp
	 +++ b/Main.cpp
	 @@ -71,6 +71,12 @@
	 #define unlink	_unlink
	 #endif
	 +#ifdef __WXMAC__
	 +// Allow the program to run and recieve focus without creating an app bundle.
	 +#include <Carbon/Carbon.h>
	 +extern "C" { void CPSEnableForegroundOperation(ProcessSerialNumber* psn); }
	 +#endif
	 +
	 IMPLEMENT_APP(MyApp)
	 bool MyApp::OnInit()
	 {
	 @@ -86,6 +92,21 @@ IMPLEMENT_APP(MyApp)
	 frame->Show(true);
	 SetTopWindow(frame);
	 frame->LoadConfig(path);
	 +
	 +#ifdef __WXMAC__
	 +  // Acquire the necessary resources to run as a GUI app without being inside
	 +  // an app bundle.
	 +  //
	 +  // Credit for this hack goes to:
	 +  //
	 +  //   https://www.miscdebris.net/blog/2010/03/30/solution-for-my-mac-os-x-gui-program-doesnt-get-focus-if-its-outside-an-application-bundle
	 +  ProcessSerialNumber psn;
	 +
	 +  GetCurrentProcess( &psn );
	 +  CPSEnableForegroundOperation( &psn );
	 +  SetFrontProcess( &psn );
	 +#endif
	 +
	 return true;
	 }
	 --
	 1.7.9
install :
	 sqlite = Formula["sqlite"]
	 ENV.prepend "LDFLAGS", "-L#{sqlite.opt_lib} -lsqlite3"
	 ENV.prepend "CFLAGS", "-I#{sqlite.opt_include}"
	 inreplace "configure", "WX_LIBS=\"$(wx-config --libs)\"", "WX_LIBS=\"$(wx-config --libs std,aui)\""
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
