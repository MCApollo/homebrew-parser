name :
	 Smlnj
homepage :
	 https://www.smlnj.org/
url :
	 http://smlnj.cs.uchicago.edu/dist/working/110.84/config.tgz
description :
	 Standard ML of New Jersey
build_deps :
link_deps :
	 :maximum_macos
optional_deps :
conflicts :
resource :
	 ['cm', 'compiler', 'runtime', 'system', 'bootstrap', 'mlrisc', 'lib', 'ckit', 'nlffi', 'cml', 'exene', 'ml-lpt', 'ml-lex', 'ml-yacc', 'ml-burg', 'pgraph', 'trace-debug-profile', 'heap2asm', 'c']
	 ['https://www.smlnj.org/dist/working/110.84/cm.tgz', 'https://www.smlnj.org/dist/working/110.84/compiler.tgz', 'https://www.smlnj.org/dist/working/110.84/runtime.tgz', 'https://www.smlnj.org/dist/working/110.84/system.tgz', 'https://www.smlnj.org/dist/working/110.84/boot.x86-unix.tgz', 'https://www.smlnj.org/dist/working/110.84/MLRISC.tgz', 'https://www.smlnj.org/dist/working/110.84/smlnj-lib.tgz', 'https://www.smlnj.org/dist/working/110.84/ckit.tgz', 'https://www.smlnj.org/dist/working/110.84/nlffi.tgz', 'https://www.smlnj.org/dist/working/110.84/cml.tgz', 'https://www.smlnj.org/dist/working/110.84/eXene.tgz', 'https://www.smlnj.org/dist/working/110.84/ml-lpt.tgz', 'https://www.smlnj.org/dist/working/110.84/ml-lex.tgz', 'https://www.smlnj.org/dist/working/110.84/ml-yacc.tgz', 'https://www.smlnj.org/dist/working/110.84/ml-burg.tgz', 'https://www.smlnj.org/dist/working/110.84/pgraph.tgz', 'https://www.smlnj.org/dist/working/110.84/trace-debug-profile.tgz', 'https://www.smlnj.org/dist/working/110.84/heap2asm.tgz', 'https://www.smlnj.org/dist/working/110.84/smlnj-c.tgz']
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 ENV.m32
	 root = prefix/"SMLNJ_HOME"
	 root.mkpath
	 cp_r buildpath, root/"config"
	 rm root/"config/targets"
	 (root/"config/targets").write targets
	 %w[cm compiler runtime system].each do |name|
	 resource(name).stage { cp_r pwd, root/"base" }
	 end
	 %w[
	 bootstrap mlrisc lib ckit nlffi
	 cml exene ml-lpt ml-lex ml-yacc ml-burg pgraph
	 trace-debug-profile heap2asm c
	 ].each do |name|
	 resource(name).stage { cp_r pwd, root }
	 end
	 inreplace root/"base/runtime/objs/mk.x86-darwin", "/usr/bin/as", "as"
	 inreplace root/"base/runtime/config/gen-posix-names.sh" do |s|
	 s.gsub! "PATH=/bin:/usr/bin", "
	 s.gsub! "/usr/include", "#{MacOS.sdk_path}/usr/include" unless MacOS::CLT.installed?
	 end
	 inreplace root/"config/_arch-n-opsys", "16*) OPSYS=darwin", "1*) OPSYS=darwin"
	 cd root do
	 system "config/install.sh"
	 end
	 %w[
	 sml heap2asm heap2exec ml-antlr
	 ml-build ml-burg ml-lex ml-makedepend
	 ml-nlffigen ml-ulex ml-yacc
	 ].each { |e| bin.install_symlink root/"bin/#{e}" }
