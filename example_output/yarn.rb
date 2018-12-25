name :
	 Yarn
homepage :
	 https://yarnpkg.com/
url :
	 https://yarnpkg.com/downloads/1.12.3/yarn-v1.12.3.tar.gz
description :
	 JavaScript package manager
build_deps :
link_deps :
	 node
optional_deps :
conflicts :
	 hadoop
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 (bin/"yarn").write_env_script "#{libexec}/bin/yarn.js", :PREFIX => HOMEBREW_PREFIX, :NPM_CONFIG_PYTHON => "/usr/bin/python"
	 (bin/"yarnpkg").write_env_script "#{libexec}/bin/yarn.js", :PREFIX => HOMEBREW_PREFIX, :NPM_CONFIG_PYTHON => "/usr/bin/python"
	 inreplace "#{libexec}/package.json", '"installationMethod": "tar"', '"installationMethod": "homebrew"'
