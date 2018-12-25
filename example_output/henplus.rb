name :
	 Henplus
homepage :
	 https://github.com/neurolabs/henplus
url :
	 https://github.com/downloads/neurolabs/henplus/henplus-0.9.8.tar.gz
description :
	 SQL shell that can handle multiple sessions in parallel
build_deps :
	 ant
link_deps :
	 :java
	 libreadline-java
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "bin/henplus" do |s|
	 s.gsub! "LD_LIBRARY_PATH", "DYLD_LIBRARY_PATH"
	 s.change_make_var! "DYLD_LIBRARY_PATH", Formula["libreadline-java"].opt_lib
	 s.gsub! "$THISDIR/..", HOMEBREW_PREFIX
	 s.gsub! "share/java/libreadline-java.jar",
	 "share/libreadline-java/libreadline-java.jar"
	 end
	 system "ant", "install", "-Dprefix=#{prefix}"
