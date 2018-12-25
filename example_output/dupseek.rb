name :
	 Dupseek
homepage :
	 http://www.beautylabs.net/software/dupseek.html
url :
	 http://www.beautylabs.net/software/dupseek-1.3.tgz
description :
	 Interactive program to find and remove duplicate files
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 bin.install "dupseek"
	 doc.install %w[changelog.txt doc.txt copyright credits.txt]
	 end
	 test do
	 mkdir "folder"
	 touch "folder/file1"
	 assert_equal "", shell_output("#{bin}/dupseek -b report -f de folder").chomp
	 touch "folder/file2"
	 assert_equal "folder\\/file2", shell_output("#{bin}/dupseek -b report -f de folder").chomp
	 assert_equal "folder\\/file1\nfolder\\/file2", shell_output("#{bin}/dupseek -b report -f e folder").chomp
	 end
