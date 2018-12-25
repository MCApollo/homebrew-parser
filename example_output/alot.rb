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
optional_deps :
conflicts :
resource :
	 ['Automat', 'attrs', 'configobj', 'constantly', 'gpg', 'hyperlink', 'incremental', 'python-magic', 'six', 'Twisted', 'urwid', 'urwidtrees', 'zope.interface']
	 ['https://files.pythonhosted.org/packages/de/05/b8e453085cf8a7f27bb1226596f4ccf5cc9e758377d60284f990bbdc592c/Automat-0.6.0.tar.gz', 'https://files.pythonhosted.org/packages/be/41/e909cb6d901e9689da947419505cc7fb7d242a08a62ee221fce6a009a523/attrs-17.2.0.tar.gz', 'https://files.pythonhosted.org/packages/64/61/079eb60459c44929e684fa7d9e2fdca403f67d64dd9dbac27296be2e0fab/configobj-5.0.6.tar.gz', 'https://files.pythonhosted.org/packages/95/f1/207a0a478c4bb34b1b49d5915e2db574cadc415c9ac3a7ef17e29b2e8951/constantly-15.1.0.tar.gz', 'https://files.pythonhosted.org/packages/ef/86/c5a34243a932346c59cb25eb49a4d1dec227974209eb9b618d0ed57ea5be/gpg-1.10.0.tar.gz', 'https://files.pythonhosted.org/packages/83/df/3bdaf38f21f93429de02f04c6a967d2154955fc5b9a6a1a0b20a682edc13/hyperlink-17.3.1.tar.gz', 'https://files.pythonhosted.org/packages/8f/26/02c4016aa95f45479eea37c90c34f8fab6775732ae62587a874b619ca097/incremental-17.5.0.tar.gz', 'https://files.pythonhosted.org/packages/84/30/80932401906eaf787f2e9bd86dc458f1d2e75b064b4c187341f29516945c/python-magic-0.4.15.tar.gz', 'https://files.pythonhosted.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz', 'https://files.pythonhosted.org/packages/a2/37/298f9547606c45d75aa9792369302cc63aa4bbcf7b5f607560180dd099d2/Twisted-17.9.0.tar.bz2', 'https://files.pythonhosted.org/packages/c7/90/415728875c230fafd13d118512bde3184d810d7bf798a631abc05fac09d0/urwid-2.0.1.tar.gz', 'https://files.pythonhosted.org/packages/88/9d/981617fa083a75cf0b5ebb0ae47c3af6fb69183be1c74cc3ac6d9a0c5964/urwidtrees-1.0.1.1.tar.gz', 'https://files.pythonhosted.org/packages/bd/d2/25349ed41f9dcff7b3baf87bd88a4c82396cf6e02f1f42bb68657a3132af/zope.interface-4.4.3.tar.gz']
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
	 end
