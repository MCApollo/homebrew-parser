name :
	 GitCinnabar
homepage :
	 https://github.com/glandium/git-cinnabar
url :
	 https://github.com/glandium/git-cinnabar/archive/0.5.0.tar.gz
description :
	 Git remote helper to interact with mercurial repositories
build_deps :
link_deps :
	 mercurial
conflicts :
	 git-remote-hg
patches :
EOF_patch :
install :
	 system "make", "helper"
	 prefix.install "cinnabar"
	 bin.install "git-cinnabar", "git-cinnabar-helper", "git-remote-hg"
	 bin.env_script_all_files(libexec, :PYTHONPATH => prefix)
