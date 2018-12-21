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
