name :
	 Braid
homepage :
	 https://cristibalan.github.io/braid/
url :
	 https://github.com/cristibalan/braid.git
description :
	 Simple tool to help track vendor branches in a Git repository
build_deps :
link_deps :
	 ruby
conflicts :
patches :
EOF_patch :
install :
	 ENV["GEM_HOME"] = libexec
	 resources.each do |r|
	 r.verify_download_integrity(r.fetch)
	 system "gem", "install", r.cached_download, "--ignore-dependencies",
	 "--no-document", "--install-dir", libexec
