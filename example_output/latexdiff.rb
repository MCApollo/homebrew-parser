name :
	 Latexdiff
homepage :
	 https://www.ctan.org/pkg/latexdiff
url :
	 https://github.com/ftilmann/latexdiff/releases/download/1.3.0/latexdiff-1.3.0.tar.gz
description :
	 Compare and mark up LaTeX file differences
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
	 bin.install %w[latexdiff-fast latexdiff-so latexdiff-vc latexrevise]
	 man1.install %w[latexdiff-vc.1 latexdiff.1 latexrevise.1]
	 doc.install Dir["doc/*"]
	 pkgshare.install %w[contrib example]
	 bin.install_symlink "latexdiff-so" => "latexdiff"
