name :
	 Kibana
homepage :
	 https://www.elastic.co/products/kibana
url :
	 https://github.com/elastic/kibana.git
description :
	 Analytics and search dashboard for Elasticsearch
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['node', 'yarn']
	 ['https://nodejs.org/dist/v8.14.0/node-v8.14.0.tar.xz', 'https://yarnpkg.com/downloads/1.12.3/yarn-v1.12.3.tar.gz']
patches :
EOF_patch :
install :
	 resource("node").stage do
	 system "./configure", "--prefix=#{libexec}/node"
	 system "make", "install"
	 end
	 rm_rf "x-pack"
	 inreplace "src/dev/typescript/projects.ts" do |s|
	 s.gsub! "new Project(resolve(REPO_ROOT, 'x-pack/tsconfig.json')),", ""
	 s.gsub! "new Project(resolve(REPO_ROOT, 'x-pack/test/tsconfig.json'), 'x-pack/test'),", ""
	 end
	 mkdir_p buildpath/".node_binaries/#{resource("node").version}/darwin-x64"
	 (buildpath/"yarn").install resource("yarn")
	 (buildpath/".brew_home/.yarnrc").write "build-from-source true\n"
	 ENV.prepend_path "PATH", buildpath/"yarn/bin"
	 ENV.prepend_path "PATH", prefix/"libexec/node/bin"
	 system "yarn", "kbn", "bootstrap"
	 system "yarn", "build", "--oss", "--release", "--skip-os-packages", "--skip-archives"
	 prefix.install Dir["build/oss/kibana-#{version}-darwin-x86_64/{bin,config,node_modules,optimize,package.json,src,ui_framework,webpackShims}"]
	 mv "licenses/APACHE-LICENSE-2.0.txt", "LICENSE.txt"
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
