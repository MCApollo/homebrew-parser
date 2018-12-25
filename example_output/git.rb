name :
	 Git
homepage :
	 https://git-scm.com
url :
	 https://www.kernel.org/pub/software/scm/git/git-2.20.1.tar.xz
description :
	 Distributed revision control system
build_deps :
link_deps :
	 gettext
	 pcre2
	 openssl
	 curl
optional_deps :
	 openssl
	 curl
conflicts :
resource :
	 ['html', 'man']
	 ['https://www.kernel.org/pub/software/scm/git/git-htmldocs-2.20.1.tar.xz', 'https://www.kernel.org/pub/software/scm/git/git-manpages-2.20.1.tar.xz']
patches :
EOF_patch :
install :
	 ENV["NO_FINK"] = "1"
	 ENV["NO_DARWIN_PORTS"] = "1"
	 ENV["NO_R_TO_GCC_LINKER"] = "1"
	 ENV["PYTHON_PATH"] = which("python")
	 ENV["PERL_PATH"] = which("perl")
	 ENV["USE_LIBPCRE2"] = "1"
	 ENV["INSTALL_SYMLINKS"] = "1"
	 ENV["LIBPCREDIR"] = Formula["pcre2"].opt_prefix
	 ENV["V"] = "1"
	 perl_version = Utils.popen_read("perl --version")[/v(\d+\.\d+)(?:\.\d+)?/, 1]
	 if MacOS.version >= :mavericks
	 ENV["PERLLIB_EXTRA"] = %W[
	 #{MacOS.active_developer_dir}
	 /Library/Developer/CommandLineTools
	 /Applications/Xcode.app/Contents/Developer
	 ].uniq.map do |p|
	 "#{p}/Library/Perl/#{perl_version}/darwin-thread-multi-2level"
	 end.join(":")
	 end
	 unless quiet_system ENV["PERL_PATH"], "-e", "use ExtUtils::MakeMaker"
	 ENV["NO_PERL_MAKEMAKER"] = "1"
	 end
	 args = %W[
	 prefix=#{prefix}
	 sysconfdir=#{etc}
	 CC=#{ENV.cc}
	 CFLAGS=#{ENV.cflags}
	 LDFLAGS=#{ENV.ldflags}
	 ]
	 if build.with?("openssl") || MacOS.version < :yosemite
	 openssl_prefix = Formula["openssl"].opt_prefix
	 args += %W[NO_APPLE_COMMON_CRYPTO=1 OPENSSLDIR=#{openssl_prefix}]
	 else
	 args += %w[NO_OPENSSL=1 APPLE_COMMON_CRYPTO=1]
	 end
	 system "make", "install", *args
	 git_core = libexec/"git-core"
	 cd "contrib/credential/osxkeychain" do
	 system "make", "CC=#{ENV.cc}",
	 "CFLAGS=#{ENV.cflags}",
	 "LDFLAGS=#{ENV.ldflags}"
	 git_core.install "git-credential-osxkeychain"
	 system "make", "clean"
	 end
	 cd "contrib/diff-highlight" do
	 system "make"
	 end
	 cd "contrib/credential/netrc" do
	 system "make", "test"
	 git_core.install "git-credential-netrc"
	 end
	 cd "contrib/subtree" do
	 system "make", "CC=#{ENV.cc}",
	 "CFLAGS=#{ENV.cflags}",
	 "LDFLAGS=#{ENV.ldflags}"
	 git_core.install "git-subtree"
	 end
	 bash_completion.install "contrib/completion/git-completion.bash"
	 bash_completion.install "contrib/completion/git-prompt.sh"
	 zsh_completion.install "contrib/completion/git-completion.zsh" => "_git"
	 cp "#{bash_completion}/git-completion.bash", zsh_completion
	 elisp.install Dir["contrib/emacs/*.el"]
	 (share/"git-core").install "contrib"
	 man.install resource("man")
	 (share/"doc/git-doc").install resource("html")
	 chmod 0644, Dir["#{share}/doc/git-doc/**/*.{html,txt}"]
	 chmod 0755, Dir["#{share}/doc/git-doc/{RelNotes,howto,technical}"]
	 if MacOS.version >= :yosemite && build.without?("openssl")
	 rm "#{libexec}/git-core/git-imap-send"
	 end
	 rm "#{libexec}/git-core/git-send-email"
	 rm_rf prefix/"Library/Perl"
	 (buildpath/"gitconfig").write <<~EOS
	 [credential]
	 \thelper = osxkeychain
	 EOS
	 etc.install "gitconfig"
