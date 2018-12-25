name :
	 RubyAT18
homepage :
	 https://www.ruby-lang.org/
url :
	 https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p374.tar.bz2
description :
	 Powerful, clean, object-oriented scripting language
build_deps :
	 pkg-config
link_deps :
	 openssl
	 readline
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 scrub_env = "/usr/bin/env RUBYLIB= RUBYOPT="
	 inreplace "mkconfig.rb", "    if /^prefix$/ =~ name\n",
	 <<~EOS.gsub(/^/, "    ")
	 if %w[CC CPP LDSHARED LIBRUBY_LDSHARED].include?(name)
	 val = val.sub("\\"", "\\"#{scrub_env} ")
	 end
	 if /^prefix$/ =~ name
	 EOS
	 rm_r "ext/tk"
	 args = %W[
	 --prefix=#{prefix}
	 --enable-shared
	 --enable-install-doc
	 ]
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 system "make", "install-doc"
	 end
	 test do
	 hello_text = shell_output("#{bin}/ruby -e 'puts :hello'")
	 assert_equal "hello\n", hello_text
	 system "#{bin}/ruby", "-e", "require 'zlib'"
	 end
