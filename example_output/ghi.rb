name :
	 Ghi
homepage :
	 https://github.com/stephencelis/ghi
url :
	 https://github.com/stephencelis/ghi/archive/1.2.0.tar.gz
description :
	 Work on GitHub issues on the command-line
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GEM_HOME"] = libexec
	 resources.each do |r|
	 r.verify_download_integrity(r.fetch)
	 system "gem", "install", r.cached_download, "--no-document",
	 "--install-dir", libexec
