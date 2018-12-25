name :
	 GitRemoteHg
homepage :
	 https://github.com/felipec/git-remote-hg
url :
	 https://github.com/felipec/git-remote-hg/archive/v0.3.tar.gz
description :
	 Transparent bidirectional bridge between Git and Mercurial
build_deps :
link_deps :
	 mercurial
	 python@2
optional_deps :
conflicts :
	 git-cinnabar
resource :
	 ['hg']
	 ['https://mercurial-scm.org/release/mercurial-4.1.3.tar.gz']
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec)
	 venv.pip_install resource("hg")
	 inreplace "git-remote-hg", /#!.*/, "#!#{libexec}/bin/python"
	 system "make", "install", "prefix=#{prefix}"
