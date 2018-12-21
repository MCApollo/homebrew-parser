name :
	 Cherokee
homepage :
	 http://cherokee-project.com/
url :
	 https://src.fedoraproject.org/repo/pkgs/cherokee/cherokee-1.2.103.tar.gz/527b3de97ef9727bfd5f6832043cf916/cherokee-1.2.103.tar.gz
description :
	 Modern, user friendly web server
build_deps :
link_deps :
	 gettext
	 openssl
conflicts :
patches :
	 https://github.com/cherokee/webserver/commit/d0213768fdc6cf3aee61fe0be398d7825c01198f.diff?full_index=1
EOF_patch :
install :
	 if build.head?
	 ENV["LIBTOOL"] = "glibtool"
	 ENV["LIBTOOLIZE"] = "glibtoolize"
	 cmd = "./autogen.sh"
	 else
	 cmd = "./configure"
