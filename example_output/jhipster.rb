name :
	 Jhipster
homepage :
	 https://www.jhipster.tech/
url :
	 https://registry.npmjs.org/generator-jhipster/-/generator-jhipster-5.7.1.tgz
description :
	 Generate, develop and deploy Spring Boot + Angular/React applications
build_deps :
link_deps :
	 :java
	 node
conflicts :
patches :
EOF_patch :
install :
	 system "npm", "install", *Language::Node.std_npm_install_args(libexec)
	 bin.install_symlink Dir["#{libexec}/bin/*"]
