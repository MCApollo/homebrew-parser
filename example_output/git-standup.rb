name :
	 GitStandup
homepage :
	 https://github.com/kamranahmedse/git-standup
url :
	 https://github.com/kamranahmedse/git-standup/archive/2.3.1.tar.gz
description :
	 Git extension to generate reports for standup meetings
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
