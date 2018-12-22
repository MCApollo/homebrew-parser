name :
	 Gcutil
homepage :
	 https://cloud.google.com/compute/docs/gcutil/
url :
	 https://dl.google.com/dl/cloudsdk/release/artifacts/gcutil-1.16.1.zip
description :
	 Manage your Google Compute Engine resources
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 libexec.install "gcutil", "lib"
	 bin.install_symlink libexec/"gcutil"
