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
conflicts :
patches :
	 https://github.com/basho/hyper/pull/6.patch?full_index=1
EOF_patch :
install :
	 ENV.deparallelize
	 ["fuse", "hyper", "yokozuna"].each do |r|
	 (buildpath/"deps/#{r}").install resource(r)
