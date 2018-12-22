name :
	 Smali
homepage :
	 https://github.com/JesusFreke/smali
url :
	 https://bitbucket.org/JesusFreke/smali/downloads/smali-2.2.5.jar
description :
	 Assembler/disassembler for Android's Java VM implementation
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 resource("baksmali-jar").stage do
	 libexec.install "baksmali-#{version}.jar" => "baksmali.jar"
	 end
	 libexec.install "smali-#{version}.jar" => "smali.jar"
	 %w[smali baksmali].each do |r|
	 libexec.install resource(r)
	 inreplace libexec/r, /^libdir=.*$/, "libdir=\"#{libexec}\""
	 chmod 0755, libexec/r
	 bin.install_symlink libexec/r
	 end
