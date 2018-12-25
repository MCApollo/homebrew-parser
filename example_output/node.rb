name :
	 Node
homepage :
	 https://nodejs.org/
url :
	 https://nodejs.org/dist/v11.4.0/node-v11.4.0.tar.gz
description :
	 Platform built on V8 to build network applications
build_deps :
	 pkg-config
	 python@2
link_deps :
	 icu4c
optional_deps :
conflicts :
resource :
	 ['npm']
	 ['https://registry.npmjs.org/npm/-/npm-6.4.1.tgz']
patches :
EOF_patch :
install :
	 args = %W[--prefix=#{prefix} --without-npm --with-intl=system-icu]
	 args << "--tag=head" if build.head?
	 system "./configure", *args
	 system "make", "install"
	 ENV.prepend_path "PATH", bin
	 bootstrap = buildpath/"npm_bootstrap"
	 bootstrap.install resource("npm")
	 system "node", bootstrap/"bin/npm-cli.js", "install", "-ddd", "--global",
	 "--prefix=#{libexec}", resource("npm").cached_download
	 cp bootstrap/"package.json", libexec/"lib/node_modules/npm"
	 rm_rf libexec/"share"
	 bash_completion.install bootstrap/"lib/utils/completion.sh" => "npm"
	 node_modules = HOMEBREW_PREFIX/"lib/node_modules"
	 node_modules.mkpath
	 rm_rf node_modules/"npm"
	 cp_r libexec/"lib/node_modules/npm", node_modules
	 ln_sf node_modules/"npm/bin/npm-cli.js", HOMEBREW_PREFIX/"bin/npm"
	 ln_sf node_modules/"npm/bin/npx-cli.js", HOMEBREW_PREFIX/"bin/npx"
	 %w[man1 man5 man7].each do |man|
	 mkdir_p HOMEBREW_PREFIX/"share/man/#{man}"
	 rm_f Dir[HOMEBREW_PREFIX/"share/man/#{man}/{npm.,npm-,npmrc.,package.json.,npx.}*"]
	 cp Dir[libexec/"lib/node_modules/npm/man/#{man}/{npm,package.json,npx}*"], HOMEBREW_PREFIX/"share/man/#{man}"
	 end
	 (node_modules/"npm/npmrc").atomic_write("prefix = #{HOMEBREW_PREFIX}\n")
