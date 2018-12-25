name :
	 Checkbashisms
homepage :
	 https://launchpad.net/ubuntu/+source/devscripts/
url :
	 https://deb.debian.org/debian/pool/main/d/devscripts/devscripts_2.18.11.tar.xz
description :
	 Checks for bashisms in shell scripts
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "scripts/checkbashisms.pl" do |s|
	 s.gsub! "###VERSION###", version
	 s.gsub! "#!/usr/bin/perl", "#!/usr/bin/perl -T"
	 end
	 bin.install "scripts/checkbashisms.pl" => "checkbashisms"
	 man1.install "scripts/checkbashisms.1"
