name :
	 Pyenv
homepage :
	 https://github.com/pyenv/pyenv
url :
	 https://github.com/pyenv/pyenv/archive/v1.2.8.tar.gz
description :
	 Python version management
build_deps :
link_deps :
	 autoconf
	 openssl
	 pkg-config
	 readline
conflicts :
patches :
EOF_patch :
install :
	 inreplace "libexec/pyenv", "/usr/local", HOMEBREW_PREFIX
	 system "src/configure"
	 system "make", "-C", "src"
	 prefix.install Dir["*"]
	 %w[pyenv-install pyenv-uninstall python-build].each do |cmd|
	 bin.install_symlink "#{prefix}/plugins/python-build/bin/#{cmd}"
