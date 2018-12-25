name :
	 Riak
homepage :
	 http://basho.com/products/riak-kv/
url :
	 https://github.com/basho/riak.git
description :
	 Distributed database
build_deps :
link_deps :
	 :arch
	 erlang@17
	 :macos
optional_deps :
conflicts :
resource :
	 ['fuse', 'hyper', 'solr', 'yokozuna']
	 ['https://github.com/jlouis/fuse.git', 'https://github.com/basho/hyper.git', 'https://github.com/basho/hyper/pull/6.patch?full_index=1', 'https://files-source.tiot.jp/riak/solr/solr-4.10.4-yz-2.tgz', 'https://github.com/basho/yokozuna.git']
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 ["fuse", "hyper", "yokozuna"].each do |r|
	 (buildpath/"deps/#{r}").install resource(r)
	 end
	 buildpath.install resource("solr")
	 inreplace "deps/yokozuna/tools/grab-solr.sh",
	 "TMP_FILE=$TMP_DIR/$FILENAME",
	 "TMP_FILE=#{buildpath}/$FILENAME"
	 system "git", "-C", "deps/hyper", "commit", "-am", "hyper-patch"
	 hyper_revision = Utils.popen_read("git", "-C", "deps/hyper", "rev-parse",
	 "HEAD").chomp
	 system "git", "-C", "deps/yokozuna", "commit", "-am", "solr-location"
	 yokozuna_revision = Utils.popen_read("git", "-C", "deps/yokozuna",
	 "rev-parse", "HEAD").chomp
	 inreplace "rebar.config.lock" do |s|
	 s.gsub! resource("hyper").specs[:revision], hyper_revision
	 s.gsub! resource("yokozuna").specs[:revision], yokozuna_revision
	 end
	 inreplace "Makefile", "git checkout $(REPO_TAG) &&",
	 "git checkout $(REPO_TAG) && mv ../../deps . &&"
	 system "make", "package"
	 logdir = var/"log/riak"
	 datadir = var/"lib/riak"
	 libexec.install Dir["distdir/osxbuild/riak-2.2.3/*"]
	 logdir.mkpath
	 datadir.mkpath
	 (datadir/"ring").mkpath
	 inreplace "#{libexec}/lib/env.sh" do |s|
	 s.change_make_var! "RUNNER_BASE_DIR", libexec
	 s.change_make_var! "RUNNER_LOG_DIR", logdir
	 end
	 inreplace "#{libexec}/etc/riak.conf" do |c|
	 c.gsub! /(platform_data_dir *=).*$/, "\\1 #{datadir}"
	 c.gsub! /(platform_log_dir *=).*$/, "\\1 #{logdir}"
	 end
	 bin.write_exec_script libexec/"bin/riak"
	 bin.write_exec_script libexec/"bin/riak-admin"
	 bin.write_exec_script libexec/"bin/riak-debug"
	 bin.write_exec_script libexec/"bin/search-cmd"
