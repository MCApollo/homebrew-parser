name :
	 Alot
homepage :
	 https://github.com/pazz/alot
url :
	 https://github.com/pazz/alot/archive/0.7.tar.gz
description :
	 Text mode MUA using notmuch mail
build_deps :
	 sphinx-doc
	 swig
link_deps :
	 gpgme
	 libmagic
	 notmuch
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
	 pkgshare.install Dir["extra/*"] - %w[extra/completion]
	 zsh_completion.install "extra/completion/alot-completion.zsh" => "_alot"
	 ENV["LC_ALL"] = "en_US.UTF-8"
	 ENV["SPHINXBUILD"] = Formula["sphinx-doc"].opt_bin/"sphinx-build"
	 cd "docs" do
	 system "make", "pickle"
	 system "make", "man", "html"
	 man1.install "build/man/alot.1"
	 doc.install Dir["build/html/*"]
