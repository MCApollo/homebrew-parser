name :
	 NumUtils
homepage :
	 https://suso.suso.org/programs/num-utils/
url :
	 https://suso.suso.org/programs/num-utils/downloads/num-utils-0.5.tar.gz
description :
	 Programs for dealing with numbers from the command-line
build_deps :
link_deps :
conflicts :
	 normalize
	 crush-tools
	 argyll-cms
patches :
EOF_patch :
install :
	 %w[average bound interval normalize numgrep numprocess numsum random range round].each do |p|
	 system "pod2man", p, "#{p}.1"
	 bin.install p
	 man1.install "#{p}.1"
