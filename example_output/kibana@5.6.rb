name :
	 KibanaAT56
homepage :
	 https://www.elastic.co/products/kibana
url :
	 https://github.com/elastic/kibana.git
description :
	 Analytics and search dashboard for Elasticsearch
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 resource("node").stage do
	 system "./configure", "--prefix=#{libexec}/node"
	 system "make", "install"
	 end
	 inreplace buildpath/"tasks/config/platforms.js", /('(linux-x64|windows-x64)',?(?!;))/, "// \\1"
	 mkdir_p buildpath/".node_binaries/#{resource("node").version}/darwin-x64"
	 ENV.prepend_path "PATH", prefix/"libexec/node/bin"
	 system "npm", "install", "-ddd", "--build-from-source", "--#{Language::Node.npm_cache_config}"
	 system "npm", "run", "build", "--", "--release", "--skip-os-packages", "--skip-archives"
	 prefix.install Dir["build/kibana-#{version}-darwin-x86_64/{bin,config,node_modules,optimize,package.json,src,ui_framework,webpackShims}"]
	 inreplace "#{bin}/kibana", %r{/node/bin/node}, "/libexec/node/bin/node"
	 inreplace "#{bin}/kibana-plugin", %r{/node/bin/node}, "/libexec/node/bin/node"
	 cd prefix do
	 inreplace "config/kibana.yml", "/var/run/kibana.pid", var/"run/kibana.pid"
	 (etc/"kibana").install Dir["config/*"]
	 rm_rf "config"
	 end
	 ln_s etc/"kibana", prefix/"config"
	 (prefix/"data").mkdir
	 (prefix/"plugins").mkdir
