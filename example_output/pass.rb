name :
	 Pass
homepage :
	 https://www.passwordstore.org/
url :
	 https://git.zx2c4.com/password-store/snapshot/password-store-1.7.3.tar.xz
description :
	 Password manager
build_deps :
link_deps :
	 gnu-getopt
	 gnupg
	 qrencode
	 tree
conflicts :
patches :
EOF_patch :
install :
	 system "make", "PREFIX=#{prefix}", "WITH_ALLCOMP=yes", "BASHCOMPDIR=#{bash_completion}", "ZSHCOMPDIR=#{zsh_completion}", "FISHCOMPDIR=#{fish_completion}", "install"
	 inreplace "#{bin}/pass", /^SYSTEM_EXTENSION_DIR=.*$/, "SYSTEM_EXTENSION_DIR=\"#{HOMEBREW_PREFIX}/lib/password-store/extensions\""
	 elisp.install "contrib/emacs/password-store.el"
	 pkgshare.install "contrib"
