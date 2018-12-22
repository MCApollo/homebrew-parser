name :
	 Redis
homepage :
	 https://redis.io/
url :
	 http://download.redis.io/releases/redis-5.0.3.tar.gz
description :
	 Persistent key-value database, with built-in net interface
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["OBJARCH"] = "-arch #{MacOS.preferred_arch}"
	 system "make", "install", "PREFIX=#{prefix}", "CC=#{ENV.cc}"
	 %w[run db/redis log].each { |p| (var/p).mkpath }
	 inreplace "redis.conf" do |s|
	 s.gsub! "/var/run/redis.pid", var/"run/redis.pid"
	 s.gsub! "dir ./", "dir #{var}/db/redis/"
	 s.sub!  /^bind .*$/, "bind 127.0.0.1 ::1"
	 end
	 etc.install "redis.conf"
	 etc.install "sentinel.conf" => "redis-sentinel.conf"
