name :
	 Fpc
homepage :
	 https://www.freepascal.org/
url :
	 https://downloads.sourceforge.net/project/freepascal/Source/3.0.4/fpc-3.0.4.source.tar.gz
description :
	 Free Pascal: multi-architecture Pascal compiler
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
	 diff --git a/compiler/systems/t_bsd.pas b/compiler/systems/t_bsd.pas
	 index b35a78ae..61d0817d 100644
	 --- a/compiler/systems/t_bsd.pas
	 +++ b/compiler/systems/t_bsd.pas
	 @@ -310,7 +310,10 @@ begin
	 if startupfile<>'' then
	 begin
	 if not librarysearchpath.FindFile(startupfile,false,result) then
	 -       result:='/usr/lib/'+startupfile
	 +       if sysutils.fileexists('/usr/lib/'+startupfile) then
	 +         result:='/usr/lib/'+startupfile
	 +       else if sysutils.fileexists('/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib/') then
	 +         result:='/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib/'+startupfile
	 end
	 else
	 result:='';
install :
	 fpc_bootstrap = buildpath/"bootstrap"
	 resource("bootstrap").stage { fpc_bootstrap.install Dir["*"] }
	 fpc_compiler = fpc_bootstrap/"ppcx64"
	 args = (MacOS.version >= :mojave) ? ['OPT="-XR/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"'] : []
	 system "make", "build", "PP=#{fpc_compiler}", *args
	 system "make", "install", "PP=#{fpc_compiler}", "PREFIX=#{prefix}"
	 bin.install_symlink lib/"#{name}/#{version}/ppcx64"
	 rm_f Dir[bin/"*.rsj"]
	 system "#{bin}/fpcmkcfg", "-p", "-d", "basepath=#{lib}/fpc/#{version}", "-o", "#{prefix}/etc/fpc.cfg"
