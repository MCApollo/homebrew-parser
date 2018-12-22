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
	 end
	 openssl = Formula["openssl"]
	 pcre = Formula["pcre"]
	 cc_opt = "-I#{pcre.opt_include} -I#{openssl.opt_include}"
	 ld_opt = "-L#{pcre.opt_lib} -L#{openssl.opt_lib}"
	 args = %W[
	 --prefix=#{prefix}
	 --sbin-path=#{bin}/nginx
	 --with-cc-opt=#{cc_opt}
	 --with-ld-opt=#{ld_opt}
	 --conf-path=#{etc}/nginx/nginx.conf
	 --pid-path=#{var}/run/nginx.pid
	 --lock-path=#{var}/run/nginx.lock
	 --http-client-body-temp-path=#{var}/run/nginx/client_body_temp
	 --http-proxy-temp-path=#{var}/run/nginx/proxy_temp
	 --http-fastcgi-temp-path=#{var}/run/nginx/fastcgi_temp
	 --http-uwsgi-temp-path=#{var}/run/nginx/uwsgi_temp
	 --http-scgi-temp-path=#{var}/run/nginx/scgi_temp
	 --http-log-path=#{var}/log/nginx/access.log
	 --error-log-path=#{var}/log/nginx/error.log
	 --with-debug
	 --with-http_addition_module
	 --with-http_auth_request_module
	 --with-http_dav_module
	 --with-http_degradation_module
	 --with-http_flv_module
	 --with-http_gunzip_module
	 --with-http_gzip_static_module
	 --with-http_mp4_module
	 --with-http_random_index_module
	 --with-http_realip_module
	 --with-http_secure_link_module
	 --with-http_slice_module
	 --with-http_ssl_module
	 --with-http_stub_status_module
	 --with-http_sub_module
	 --with-http_v2_module
	 --with-ipv6
	 --with-mail
	 --with-mail_ssl_module
	 --with-pcre
	 --with-pcre-jit
	 --with-stream
	 --with-stream_realip_module
	 --with-stream_ssl_module
	 --with-stream_ssl_preread_module
	 ]
	 if build.with? "passenger"
	 nginx_ext = `#{Formula["passenger"].opt_bin}/passenger-config --nginx-addon-dir`.chomp
	 args << "--add-module=#{nginx_ext}"
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
