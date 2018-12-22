name :
	 Viewvc
homepage :
	 http://www.viewvc.org
url :
	 https://github.com/viewvc/viewvc/releases/download/1.1.26/viewvc-1.1.26.tar.gz
description :
	 Browser interface for CVS and Subversion repositories
build_deps :
link_deps :
	 subversion
conflicts :
patches :
EOF_patch :
install :
	 system "python", "./viewvc-install", "--prefix=#{libexec}", "--destdir="
	 Pathname.glob(libexec/"bin/*") do |f|
	 next if f.directory?
	 bin.install_symlink f => "viewvc-#{f.basename}"
	 end
