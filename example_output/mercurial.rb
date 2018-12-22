name :
	 Mercurial
homepage :
	 https://mercurial-scm.org/
url :
	 https://mercurial-scm.org/release/mercurial-4.8.1.tar.gz
description :
	 Scalable distributed version control system
build_deps :
link_deps :
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_path "PATH", Formula["python@2"].opt_libexec/"bin"
	 system "make", "PREFIX=#{prefix}", "install-bin"
	 cd "contrib/chg" do
	 system "make", "PREFIX=#{prefix}", "HGPATH=#{bin}/hg", \
	 "HG=#{bin}/hg"
	 bin.install "chg"
	 end
	 (buildpath/"hgrc").write <<~EOS
	 [pager]
	 pager = less -FRX
	 EOS
	 (etc/"mercurial").install "hgrc"
	 man1.install "doc/hg.1"
	 man5.install "doc/hgignore.5", "doc/hgrc.5"
	 bash_completion.install "contrib/bash_completion" => "hg-completion.bash"
	 zsh_completion.install "contrib/zsh_completion" => "_hg"
