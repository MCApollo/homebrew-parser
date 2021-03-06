name :
	 Joshua
homepage :
	 https://joshua.incubator.apache.org/
url :
	 https://cs.jhu.edu/~post/files/joshua-6.0.5.tgz
description :
	 Statistical machine translation decoder
build_deps :
	 ant
	 boost
	 md5sha1sum
	 python@2
link_deps :
	 :java
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 rm Dir["lib/*.{gr,tar.gz}"]
	 rm_rf "lib/README"
	 rm_rf "bin/.gitignore"
	 head do
	 system "ant"
	 end
	 libexec.install Dir["*"]
	 bin.install_symlink Dir["#{libexec}/bin/*"]
	 inreplace "#{bin}/joshua-decoder", "JOSHUA\=$(dirname $0)/..", "#JOSHUA\=$(dirname $0)/.."
	 inreplace "#{bin}/decoder", "JOSHUA\=$(dirname $0)/..", "#JOSHUA\=$(dirname $0)/.."
