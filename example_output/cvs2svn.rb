name :
	 Cvs2svn
homepage :
	 http://cvs2svn.tigris.org/
url :
	 http://cvs2svn.tigris.org/files/documents/1462/49543/cvs2svn-2.5.0.tar.gz
description :
	 Tool for converting from CVS to Subversion
build_deps :
link_deps :
	 python@2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "python", "setup.py", "install", "--prefix=#{prefix}"
	 system "make", "man"
	 man1.install gzip("cvs2svn.1", "cvs2git.1", "cvs2bzr.1")
	 prefix.install %w[ BUGS COMMITTERS HACKING
	 cvs2bzr-example.options
	 cvs2git-example.options
	 cvs2hg-example.options
	 cvs2svn-example.options contrib ]
	 doc.install Dir["{doc,www}/*"]
