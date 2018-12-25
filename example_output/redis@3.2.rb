name :
	 RedisAT32
homepage :
	 https://redis.io/
url :
	 http://download.redis.io/releases/redis-3.2.12.tar.gz
description :
	 Persistent key-value database, with built-in net interface
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["OBJARCH"] = "-arch #{MacOS.preferred_arch}"
	 args = %W[
	 PREFIX=#{prefix}
	 CC=#{ENV.cc}
	 ]
	 args << "MALLOC=jemalloc" if build.with? "jemalloc"
	 system "make", "install", *args
	 %w[run db/redis log].each { |p| (var/p).mkpath }
	 inreplace "redis.conf" do |s|
	 s.gsub! "/var/run/redis.pid", var/"run/redis.pid"
	 s.gsub! "dir ./", "dir #{var}/db/redis/"
	 s.gsub! "\
	 end
	 etc.install "redis.conf"
	 etc.install "sentinel.conf" => "redis-sentinel.conf"
