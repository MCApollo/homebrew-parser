name :
	 Grc
homepage :
	 https://korpus.juls.savba.sk/~garabik/software/grc.html
url :
	 https://github.com/garabik/grc/archive/v1.11.3.tar.gz
description :
	 Colorize logfiles and command output
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 grc_bashrc = etc/"grc.bashrc"
	 bad = /^    alias ls='colourify ls --color'$/
	 if grc_bashrc.exist? && File.read(grc_bashrc) =~ bad
	 inreplace grc_bashrc, bad, "    alias ls='colourify ls'"
	 end
