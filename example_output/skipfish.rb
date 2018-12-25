name :
	 Skipfish
homepage :
	 https://code.google.com/archive/p/skipfish/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/skipfish/skipfish-2.10b.tgz
description :
	 Web application security scanner
build_deps :
link_deps :
	 libidn
	 openssl
	 pcre
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.append "CFLAGS", "-I#{HOMEBREW_PREFIX}/include"
	 ENV.append "LDFLAGS", "-L#{HOMEBREW_PREFIX}/lib"
	 chmod 0755, "src/config.h"
	 inreplace "src/config.h",
	 "#define ASSETS_DIR              \"assets\"",
	 "#define ASSETS_DIR	       \"#{libexec}/assets\""
	 system "make"
	 bin.install "skipfish"
	 libexec.install %w[assets dictionaries config signatures doc]
	 end
	 def caveats; <<~EOS
	 NOTE: Skipfish uses dictionary-based probes and will not run until
	 you have specified a dictionary for it to use. Please read:
	 #{libexec}/doc/dictionaries.txt
	 carefully to make the right choice. This step has a profound impact
	 on the quality of results later on.
	 Use this command to print usage information:
	 skipfish -h
	 EOS
