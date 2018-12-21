name :
	 RdiffBackup
homepage :
	 https://www.nongnu.org/rdiff-backup/
url :
	 https://savannah.nongnu.org/download/rdiff-backup/rdiff-backup-1.2.8.tar.gz
description :
	 Backs up one directory to another--also works over networks
build_deps :
link_deps :
	 librsync
conflicts :
patches :
	 https://git.archlinux.org/svntogit/community.git/plain/trunk/rdiff-backup-1.2.8-librsync-1.0.0.patch?h=packages/rdiff-backup
EOF_patch :
install :
	 archs = archs_for_command("python")
	 archs.remove_ppc!
	 archs.delete :x86_64 if Hardware::CPU.is_32_bit?
	 ENV["ARCHFLAGS"] = archs.as_arch_flags
	 system "python", "setup.py", "--librsync-dir=#{prefix}", "build"
	 libexec.install Dir["build/lib.macosx*/rdiff_backup"]
	 libexec.install Dir["build/scripts-*/*"]
	 man1.install Dir["*.1"]
	 bin.install_symlink Dir["#{libexec}/rdiff-backup*"]
