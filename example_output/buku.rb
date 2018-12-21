name :
	 Buku
homepage :
	 https://github.com/jarun/Buku
url :
	 https://github.com/jarun/Buku/archive/v4.0.tar.gz
description :
	 Powerful command-line bookmark manager
build_deps :
link_deps :
	 openssl
	 python
conflicts :
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec, "python3")
	 venv.pip_install resources
	 inreplace "buku.py", "#!/usr/bin/env python3", "#!#{libexec}/bin/python"
	 bin.install "buku.py" => "buku"
	 man1.install "buku.1"
	 bash_completion.install "auto-completion/bash/buku-completion.bash"
	 fish_completion.install "auto-completion/fish/buku.fish"
	 zsh_completion.install "auto-completion/zsh/_buku"
