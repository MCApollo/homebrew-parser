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
