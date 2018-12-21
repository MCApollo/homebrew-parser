name :
	 Nginx
homepage :
	 https://nginx.org/
url :
	 https://nginx.org/download/nginx-1.15.7.tar.gz
description :
	 HTTP(S) server and reverse proxy, and IMAP/POP3 proxy server
build_deps :
link_deps :
	 openssl
	 pcre
	 passenger
conflicts :
patches :
EOF_patch :
install :
	 inreplace "conf/nginx.conf" do |s|
	 s.gsub! "listen       80;", "listen       8080;"
	 s.gsub! "    #}\n\n}", "    #}\n    include servers/*;\n}"
	 (etc/"nginx/servers").mkpath
	 (var/"run/nginx").mkpath
	 html = prefix/"html"
	 dst = var/"www"
	 if dst.exist?
	 html.rmtree
	 dst.mkpath
	 else
	 dst.dirname.mkpath
	 html.rename(dst)
