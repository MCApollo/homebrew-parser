name :
	 Html2text
homepage :
	 http://www.mbayer.de/html2text/
url :
	 http://www.mbayer.de/html2text/downloads/html2text-1.3.2a.tar.gz
description :
	 Advanced HTML-to-text converter
build_deps :
link_deps :
conflicts :
patches :
	 http://www.mbayer.de/html2text/downloads/patch-utf8-html2text-1.3.2a.diff
EOF_patch :
install :
	 inreplace "configure",
	 'for i in "CC" "g++" "cc" "$CC"; do',
	 'for i in "g++"; do'
	 system "./configure"
	 system "make", "all"
	 bin.install "html2text"
	 man1.install "html2text.1.gz"
	 man5.install "html2textrc.5.gz"
	 end
	 test do
	 path = testpath/"index.html"
	 path.write <<~EOS
	 <!DOCTYPE html>
	 <html>
	 <head><title>Home</title></head>
	 <body><p>Hello World</p></body>
	 </html>
	 EOS
	 output = `#{bin}/html2text #{path}`.strip
	 assert_equal "Hello World", output
	 assert_equal 0, $CHILD_STATUS.exitstatus
	 end
	 end
