name :
	 Rats
homepage :
	 https://security.web.cern.ch/security/recommendations/en/codetools/rats.shtml
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/rough-auditing-tool-for-security/rats-2.4.tgz
description :
	 Rough auditing tool for security
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--infodir=#{info}"
	 system "make", "install"
