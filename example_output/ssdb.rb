name :
	 Ssdb
homepage :
	 http://ssdb.io/
url :
	 https://github.com/ideawu/ssdb/archive/1.9.4.tar.gz
description :
	 NoSQL database supporting many data structures: Redis alternative
build_deps :
	 autoconf
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "tools/ssdb-cli", /^DIR=.*$/, "DIR=#{prefix}"
	 system "make", "CC=#{ENV.cc}", "CXX=#{ENV.cxx}"
	 system "make", "install", "PREFIX=#{prefix}"
	 %w[bench cli dump repair server].each do |suffix|
	 bin.install "#{prefix}/ssdb-#{suffix}"
	 end
	 ["run", "db/ssdb", "db/ssdb_slave", "log"].each do |dir|
	 (var/dir).mkpath
	 end
	 inreplace "ssdb.conf" do |s|
	 s.gsub! "work_dir = ./var", "work_dir = #{var}/db/ssdb/"
	 s.gsub! "pidfile = ./var/ssdb.pid", "pidfile = #{var}/run/ssdb.pid"
	 s.gsub! "\toutput: log.txt", "\toutput: #{var}/log/ssdb.log"
	 end
	 inreplace "ssdb_slave.conf" do |s|
	 s.gsub! "work_dir = ./var_slave", "work_dir = #{var}/db/ssdb_slave/"
	 s.gsub! "pidfile = ./var_slave/ssdb.pid", "pidfile = #{var}/run/ssdb_slave.pid"
	 s.gsub! "\toutput: log_slave.txt", "\toutput: #{var}/log/ssdb_slave.log"
	 end
	 etc.install "ssdb.conf"
	 etc.install "ssdb_slave.conf"
