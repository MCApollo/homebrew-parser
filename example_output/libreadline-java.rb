name :
	 LibreadlineJava
homepage :
	 https://java-readline.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/java-readline/java-readline/0.8.0/libreadline-java-0.8.0-src.tar.gz
description :
	 Port of GNU readline for Java
build_deps :
link_deps :
	 :java
	 readline
conflicts :
patches :
EOF_patch :
	 diff --git a/src/native/org_gnu_readline_Readline.c b/src/native/org_gnu_readline_Readline.c
	 index f601c73..b26cafc 100644
	 --- a/src/native/org_gnu_readline_Readline.c
	 +++ b/src/native/org_gnu_readline_Readline.c
	 @@ -430,7 +430,7 @@ const char *java_completer(char *text, int state) {
	 jtext = (*jniEnv)->NewStringUTF(jniEnv,text);
	 if (jniMethodId == 0) {
	 -    return;
	 +    return ((const char *)NULL);
	 }
	 completion = (*jniEnv)->CallObjectMethod(jniEnv, jniObject,
install :
	 java_home = ENV["JAVA_HOME"]
	 if `javadoc -X`.include? "doclint"
	 inreplace "Makefile",
	 "-version -author org.gnu.readline test",
	 "-version -author org.gnu.readline -Xdoclint:none test"
	 end
	 if File.exist? "#{java_home}/include/jni.h"
	 ENV["JAVAINCLUDE"] = "#{java_home}/include"
	 ENV["JAVANATINC"]  = "#{java_home}/include/darwin"
	 elsif File.exist? "/System/Library/Frameworks/JavaVM.framework/Versions/Current/Headers/jni.h"
	 ENV["JAVAINCLUDE"] = "/System/Library/Frameworks/JavaVM.framework/Versions/Current/Headers/"
	 ENV["JAVANATINC"]  = "/System/Library/Frameworks/JavaVM.framework/Versions/Current/Headers/"
	 end
	 inreplace "Makefile" do |s|
	 s.change_make_var! "PREFIX", prefix
	 s.change_make_var! "JAVALIBDIR", "$(PREFIX)/share/libreadline-java"
	 s.change_make_var! "JAVAINCLUDE", ENV["JAVAINCLUDE"]
	 s.change_make_var! "JAVANATINC", ENV["JAVANATINC"]
	 s.gsub! "*.so", "*.jnilib"
	 s.gsub! "install -D", "install -c"
	 end
	 inreplace "src/native/Makefile" do |s|
	 readline = Formula["readline"]
	 s.change_make_var! "INCLUDES", "-I $(JAVAINCLUDE) -I $(JAVANATINC) -I #{readline.opt_include}"
	 s.change_make_var! "LIBPATH", "-L#{readline.opt_lib}"
	 s.change_make_var! "CC", "cc"
	 s.gsub! "LIB_EXT := so", "LIB_EXT := jnilib"
	 s.gsub! "$(CC) -shared $(OBJECTS) $(LIBPATH) $($(TG)_LIBS) -o $@",
	 "$(CC) -install_name #{HOMEBREW_PREFIX}/lib/$(LIB_PRE)$(TG).$(LIB_EXT) -dynamiclib $(OBJECTS) $(LIBPATH) $($(TG)_LIBS) -o $@"
	 end
	 pkgshare.mkpath
	 system "make", "jar"
	 system "make", "build-native"
	 system "make", "install"
	 doc.install "api"
